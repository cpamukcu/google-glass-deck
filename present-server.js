// Runs the Google Glass presentation from this Mac, with no internet:
//  - serves this folder (deck, presenter view, phone remote, videos with Range support so clips can seek)
//  - /api/state and /api/cmd link the deck, the presenter view and the phone remote
//  - a 4-digit code (new each start) must come with every phone command; the deck shows it with the QR
// Start it with "Start Presenting.command". Uses only Node's built-in modules.
const http = require('http'), fs = require('fs'), path = require('path'), os = require('os');
const PORT = +process.env.PORT || 8000, ROOT = __dirname;
const CODE = String(1000 + Math.floor(Math.random() * 9000));
const TYPES = {'.html':'text/html; charset=utf-8','.js':'text/javascript; charset=utf-8','.css':'text/css; charset=utf-8','.json':'application/json',
  '.png':'image/png','.jpg':'image/jpeg','.jpeg':'image/jpeg','.svg':'image/svg+xml','.webp':'image/webp','.mp4':'video/mp4','.md':'text/plain; charset=utf-8','.txt':'text/plain; charset=utf-8','.pdf':'application/pdf'};
let state = {slide:0,total:0,notes:null,next:'',title:'',t:0}, cmds = [], cmdId = 0, lastPhone = 0;
const json = (res, o, code = 200) => { const b = JSON.stringify(o); res.writeHead(code, {'Content-Type':'application/json','Cache-Control':'no-store','Content-Length':Buffer.byteLength(b)}); res.end(b); };
// addresses a phone on the same Wi-Fi / hotspot can reach: real interfaces only (VPN tunnels like utun* are skipped),
// iPhone-hotspot and Wi-Fi first, so the QR always points at the right one
const VPN = /^(utun|tun|tap|ipsec|ppp|gif|stf|llw|awdl|anpi|bridge(?!100))/;
const rank = a => a.startsWith('172.20.10.') ? 0 : a.startsWith('192.168.') ? 1 : a.startsWith('172.') ? 2 : 3;
const lanIps = () => Object.entries(os.networkInterfaces())
  .flatMap(([name, list]) => VPN.test(name) ? [] : list.filter(a => a.family === 'IPv4' && !a.internal).map(a => a.address))
  .sort((a, b) => rank(a) - rank(b));
const allIps = () => Object.values(os.networkInterfaces()).flat().filter(a => a && a.family === 'IPv4' && !a.internal).map(a => a.address);
// the code is only handed to a browser running on this Mac (the deck), never to other devices on the Wi-Fi
const isLocal = req => { const a = (req.socket.remoteAddress || '').replace(/^::ffff:/, ''); return a === '127.0.0.1' || a === '::1' || allIps().includes(a); };
const body = (req, cb) => { let b = ''; req.on('data', d => { b += d; if (b.length > 1e5) req.destroy(); }); req.on('end', () => { let o = {}; try { o = JSON.parse(b || '{}'); } catch (e) {} cb(o); }); };

http.createServer((req, res) => {
  const u = new URL(req.url, 'http://x'); let p = decodeURIComponent(u.pathname);
  if (p === '/api/state') {
    if (req.method === 'POST') return body(req, o => { if (isLocal(req)) Object.assign(state, o); json(res, {ok:true}); });
    return json(res, {...state, phone: Date.now() - lastPhone < 8000});
  }
  if (p === '/api/info') return json(res, isLocal(req) ? {ips: lanIps(), port: PORT, code: CODE} : {ips: lanIps(), port: PORT});
  if (p === '/api/hello') return body(req, o => { if (String(o.code) !== CODE) return json(res, {ok:false}, 403); lastPhone = Date.now(); json(res, {ok:true}); });
  if (p === '/api/cmd') {
    if (req.method === 'POST') return body(req, o => {
      const local = isLocal(req);
      if (!local && String(o.code) !== CODE) return json(res, {ok:false}, 403);
      if (!local) lastPhone = Date.now();
      cmds.push({id:++cmdId, cmd:o.cmd, n:o.n}); cmds = cmds.slice(-50); json(res, {ok:true});
    });
    const since = +u.searchParams.get('since') || 0;
    return json(res, {id: cmdId, cmds: cmds.filter(c => c.id > since), phone: Date.now() - lastPhone < 8000});
  }
  if (p === '/') p = '/index.html'; else if (p === '/remote' || p === '/presenter') p += '.html';
  const file = path.normalize(path.join(ROOT, p));
  if (!file.startsWith(ROOT + path.sep) || file.slice(ROOT.length).split(path.sep).some(s => s.startsWith('.'))) { res.writeHead(403); return res.end(); }
  fs.stat(file, (err, st) => {
    if (err || !st.isFile()) { res.writeHead(404); return res.end('Not found'); }
    const head = {'Content-Type': TYPES[path.extname(file).toLowerCase()] || 'application/octet-stream', 'Accept-Ranges':'bytes', 'Cache-Control':'no-cache'};
    const m = req.headers.range && /bytes=(\d*)-(\d*)/.exec(req.headers.range);
    if (m) {
      const start = m[1] ? +m[1] : st.size - +m[2], end = m[1] && m[2] ? Math.min(+m[2], st.size - 1) : st.size - 1;
      if (isNaN(start) || start < 0 || start >= st.size || start > end) { res.writeHead(416, {'Content-Range':'bytes */'+st.size}); return res.end(); }
      res.writeHead(206, {...head, 'Content-Range':`bytes ${start}-${end}/${st.size}`, 'Content-Length': end-start+1});
      return req.method === 'HEAD' ? res.end() : fs.createReadStream(file, {start, end}).pipe(res);
    }
    res.writeHead(200, {...head, 'Content-Length': st.size});
    req.method === 'HEAD' ? res.end() : fs.createReadStream(file).pipe(res);
  });
}).listen(PORT, '0.0.0.0', () => {
  const ips = lanIps();
  console.log('\n  Google Glass presentation is running.   Phone code: ' + CODE);
  console.log('  Deck       http://localhost:' + PORT + '/   (F = full screen, N = notes, H = QR, B = black)');
  console.log('  Presenter  http://localhost:' + PORT + '/presenter');
  ips.forEach(ip => console.log('  Phone      http://' + ip + ':' + PORT + '/remote.html?code=' + CODE));
  if (!ips.length) console.log('  No network yet: join your phone hotspot, then start again for the phone remote.');
  console.log('\n  Keep this window open while you present.\n');
});

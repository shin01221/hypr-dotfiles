
      try {
        (function t({contextBridge:r,ipcRenderer:n}){if(!n)return;n.on("__ELECTRON_LOG_IPC__",(i,a)=>{window.postMessage({cmd:"message",...a})}),n.invoke("__ELECTRON_LOG__",{cmd:"getOptions"}).catch(i=>console.error(new Error(`electron-log isn't initialized in the main process. Please call log.initialize() before. ${i.message}`)));const o={sendToMain(i){try{n.send("__ELECTRON_LOG__",i)}catch(a){console.error("electronLog.sendToMain ",a,"data:",i),n.send("__ELECTRON_LOG__",{cmd:"errorHandler",error:{message:a==null?void 0:a.message,stack:a==null?void 0:a.stack},errorName:"sendToMain"})}},log(...i){o.sendToMain({data:i,level:"info"})}};for(const i of["error","warn","info","verbose","debug","silly"])o[i]=(...a)=>o.sendToMain({data:a,level:i});if(r&&process.contextIsolated)try{r.exposeInMainWorld("__electronLog",o)}catch{}typeof window=="object"?window.__electronLog=o:__electronLog=o})(require('electron'));
      } catch(e) {
        console.error(e);
      }
    
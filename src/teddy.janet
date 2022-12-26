(import janet-termios :as term)

(def editor-state
  @{:cx 0
    :cy 0
    })

(var exit-loop false)

(defn render-screen [] 
  (break))

(defn handle-keystroke [] 
  (let [key (term/read-key)]
    (when (= (string/from-bytes key) "q")
      (set exit-loop true)
      (break))
    (case key
      (do (file/write stdout (string/from-bytes key))
          (file/flush stdout)))))

(defn main-loop []
  (while (not exit-loop)
    (render-screen)
    (handle-keystroke)))

(defn load-file [] 
  (break))

(defn save-file [] 
  (break))

(defn initialize-state []
  (break))

(defn init [] 

  (initialize-state)
  
  (print "Starting Teddy")
  (term/enable-raw-mode))

(defn exit [] 
  (term/disable-raw-mode)
  (print "Quitting Teddy"))

(defn main [& args]
  (defer (exit)
         (init)

         (main-loop)))
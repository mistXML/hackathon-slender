# 🎮 A32 and the 8 Pages

A32 and the 8 Pages is a **Slender Man–style first-person survival horror** game set inside A32, B52, and the surrounding Jubilee forest — except instead of Slender, you are being stalked by **Jamie Twycross**.

Built in under 24 hours during a hackathon, this project is both a horror game and a tribute to the life lessons we picked up in Jamie’s Programming & Algorithms coursework — ship early, stay curious, try new tools, and never assume GitHub will be up when the deadline hits.

---

## ✧ Premise

You must locate **8 scattered notes** left by a missing classmate, who had gone mad after finishing the coursework.  
Each page you pick up increases the **intensity and frequency** of Jamie’s appearances.  
Survive long enough to grab all 8 — or get caught.

---

## 🧠 Inspiration

This project was inspired from Jamie's challenging coursework and is a tongue-in-cheek love letter to Jamie’s teaching style — especially his insistence on finishing early in case GitHub dies at 23:59.

---

## 🏗 How We Built It

- **Engine:** Godot 4, Blender
- **Script:** GDScript
- **Assets:** Combination of custom meshes and Creative Commons imports
- **Workflow:** Parallel tasking — half of team built environments, half implemented player & enemy logic
- **Version Control:** Git & GitHub (with merge conflict battle scars to prove it)

---

## 🔧 Gameplay & Technical Breakdown

### Core Mechanics
- **Page collection system** increments difficulty and updates game state
- **Dynamic horror pacing** — the more you collect, the more aggressive the threat becomes
- **Player controller** using standard Godot 3D kinematic controls

### Jamie Behaviour
- Appears and repositions based on player progress and distance
- Presence frequency scales with number of collected notes
- Maintains pressure without predictable pattern to preserve fear response

### Level Design
- Interior sections (A32, B52) + exterior forest environment
- Layout guided by classic “yellow tape” principles for visual navigation
- Mix of self-modeled structures and imported assets for speed

### Shading & Visuals
- Basic screen-space effects
- Shader variables controlled via GDScript for dynamic cues

---

## 😱 Challenges

- **Zero Godot experience** for most contributors — learned engine on the fly
- **Time pressure** — game logic, environment, and shaders built in parallel
- **Merge hell** — four sub-projects merged into one repo with broken interactions to fix at T-minus minutes
- **Final-minute bug** — page pickup function broke after merge and had to be troubleshooted under deadline

---

## 🏁 Accomplishments

- Shipped a **fully playable 3D horror prototype** in 24 hours
- Learned engine, scripting, export pipeline, shaders, and Git workflow on the fly
- Built something cohesive despite parallel development and constant breakage
- Preserved both humour and horror in one deliverable

---

## 📚 What We Learned

- Godot scenes/environment vs procedural trade-offs
- When to import vs when to model from scratch
- Shader logic and binding uniforms via GDScript
- Team collaboration under fire (and why merge early and often is not optional)
- And most importantly: **submit early because GitHub owes you nothing**

---

## 🧭 What’s Next

Probably “**Coursework 3 and the 8 Pages**” — assuming we pass Coursework 3 first.


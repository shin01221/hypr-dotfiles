
import bpy
from . addon import Node_editor
from . addon import Animation_mode
from . addon import Shade_set
from . addon import Render_engine
from . addon import Object_apply
from . addon import Extras_custom
from . addon import Physics_add
from . addon import Quick_edit
from . addon import Copy_data 


def register():
    Node_editor.register()
    Animation_mode.register()
    Shade_set.register()
    Render_engine.register()
    Object_apply.register()
    Extras_custom.register()
    Physics_add.register()
    Quick_edit.register()
    Copy_data.register()
 
        
def unregister():
    Node_editor.unregister()
    Animation_mode.unregister()
    Shade_set.unregister()
    Render_engine.unregister()
    Object_apply.unregister()
    Extras_custom.unregister()
    Physics_add.unregister()
    Quick_edit.unregister()
    Copy_data.unregister()
   




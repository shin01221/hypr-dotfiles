
import bpy
import os 
from bpy.types import Menu, Operator

class Scale_Apply(Operator):
    bl_idname = "scale.apply"
    bl_label = "Scale"

    def execute(self, context):
        bpy.ops.object.transform_apply(scale=True)
        return {'FINISHED'}
    
class Rotation_Apply(Operator):
    bl_idname = "rotation.apply"
    bl_label = "Rotation"

    def execute(self, context):
        bpy.ops.object.transform_apply(rotation=True)
        return {'FINISHED'}
    
class Location_Apply(Operator):
    bl_idname = "location.apply"
    bl_label = "Location"

    def execute(self, context):
        bpy.ops.object.transform_apply(location=True)
        return {'FINISHED'}
    
    
class ScaleAndRotation_Apply(Operator):
    bl_idname = "scaleandrotation.apply"
    bl_label = "Rotation & Scale"

    def execute(self, context):
        bpy.ops.object.transform_apply(rotation=True, scale=True)
        return {'FINISHED'}
    
class OBJECT_MT_PIE_Applydatapie(Menu):
    bl_label = "Apply"
    
    @classmethod
    def poll(cls, context):
        obj = context.active_object
        return obj and obj.type == "MESH"

    def draw(self, context):
        layout = self.layout
        pcoll = preview_collections["main"]
        pie = layout.menu_pie()
        scale_icon = pcoll["scale_icon"]
        lnr_icon = pcoll["lnr_icon"]
        rotation_icon = pcoll["rotation_icon"]
        location_icon = pcoll["location_icon"]
        pie.operator("Scale.apply", icon_value=scale_icon.icon_id)
        pie.operator("Rotation.apply", icon_value=rotation_icon.icon_id)
        pie.operator("Location.apply", icon_value=location_icon.icon_id)
        pie.operator("Scaleandrotation.apply", icon_value=lnr_icon.icon_id)



global_addon_keymaps = []
preview_collections = {}
classes =(
    OBJECT_MT_PIE_Applydatapie,
    Scale_Apply,
    Rotation_Apply,
    Location_Apply,
    ScaleAndRotation_Apply,
)


def register():
    import bpy.utils.previews
    pcoll = bpy.utils.previews.new()
    for cls in classes:
        bpy.utils.register_class(cls)
    
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:

        keymap = window_manager.keyconfigs.addon.keymaps.new(name='3D View', space_type = 'VIEW_3D')
        
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'T', 'PRESS', ctrl=True,)
        keymap_item.properties.name = "OBJECT_MT_PIE_Applydatapie"


        global_addon_keymaps.append((keymap, keymap_item))

    my_icons_dir = os.path.join(os.path.dirname(__file__), "icons")
    pcoll.load("scale_icon", os.path.join(my_icons_dir, "scale.png"), 'IMAGE')
    pcoll.load("rotation_icon", os.path.join(my_icons_dir, "rotation.png"), 'IMAGE')
    pcoll.load("location_icon", os.path.join(my_icons_dir, "location.png"), 'IMAGE')
    pcoll.load("lnr_icon", os.path.join(my_icons_dir, "locationandscale.png"), 'IMAGE')

    preview_collections["main"] = pcoll
        
def unregister():
    for cls in reversed(classes):
        bpy.utils.unregister_class(cls)
    
    window_manager = bpy.context.window_manager
    if window_manager and window_manager.keyconfigs and window_manager.keyconfigs.addon:
        
        for keymap, keymap_item in global_addon_keymaps:
            keymap.keymap_items.remove(keymap_item)

    global_addon_keymaps.clear()

    for pcoll in preview_collections.values():
        bpy.utils.previews.remove(pcoll)
    preview_collections.clear()
    

if __name__ == "__main__":
    register()

    bpy.ops.wm.call_menu_pie(name="OBJECT_MT_PIE_Applydatapie") 
    
import bpy

def Apply_Modifier_Inorder():
    obj = obj = bpy.context.active_object
    if obj.modifiers:
        for modifier in reversed(obj.modifiers):
            bpy.ops.object.modifier_apply(modifier=modifier.name)

def Reset_transform():
    bpy.context.object.location[1] = 0
    bpy.context.object.location[2] = 0
    bpy.context.object.location[0] = 0
    bpy.context.object.rotation_euler[1] = 0
    bpy.context.object.rotation_euler[2] = 0
    bpy.context.object.rotation_euler[0] = 0

def Clear_Scene():
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.delete()



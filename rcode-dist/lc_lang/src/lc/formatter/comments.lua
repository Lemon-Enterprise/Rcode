local Comments = {}
function Comments.is_comment(text) return text:sub(1, 2) == "--" end
return Comments

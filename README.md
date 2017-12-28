# WTProgressView
A simple progressview written in swift

This ProgressView provides the functionality of making a progress bar with a marking indicator as well.
just initialize this view and add it to your view

# Adding To a View
let progressView = WTProgressView(frame: CGRect(x: 50 , y: 50 , width : 200 , height : 10), fillColor: UIColor.red, value: 50, hasIndicatorBar: true)
yourSuperView.addSubView(progressView)

# Animating to desired value
for animation you have to call the func animateTo(value , duration)

for usage , simply drag the WTProgressView file in your project.

any improvements and issues are welcomed

Thanks. :)

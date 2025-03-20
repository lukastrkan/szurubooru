<div class='post-content post-type-<%- ctx.post.type %>'>
    <% if (['image', 'animation' ].includes(ctx.post.type)) { %>

        <img class='resize-listener' alt='' src='<%- ctx.post.contentUrl %>' />

        <% } else if (ctx.post.type==='flash' ) { %>

            <object class='resize-listener' width='<%- ctx.post.canvasWidth %>' height='<%- ctx.post.canvasHeight %>'
                data='<%- ctx.post.contentUrl %>'>
                <param name='wmode' value='opaque' />
                <param name='movie' value='<%- ctx.post.contentUrl %>' />
            </object>

            <% } else if (ctx.post.type==='video' ) { %>

                <video-js class='resize-listener vjs-default-skin' controls playsinline autoplay='<%- ctx.autoplay %>'
                    loop='<%- (ctx.post.flags || []).includes("loop") %>'>
                    <source src='<%- ctx.post.contentUrl %>' type='<%- ctx.post.mimeType %>' />
                    Your browser doesn't support this video format.
                </video-js>

                <% } else { console.log(new Error('Unknown post type')); } %>

                    <div class='post-overlay resize-listener'>
                    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        if (document.querySelector('video-js')) {
            videojs(document.querySelector('video-js'));
        }
    });
</script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.21.1/video-js.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.21.1/video.min.js"></script>
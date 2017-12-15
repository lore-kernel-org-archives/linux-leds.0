From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] dt: bindings: as3645a: Update dt node example
 with standard
Date: Fri, 15 Dec 2017 16:54:12 -0600
Message-ID: <20171215225412.x5awuc5vulornvfr@rob-hp-laptop>
References: <20171212215024.30116-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171212215024.30116-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tue, Dec 12, 2017 at 03:50:23PM -0600, Dan Murphy wrote:
> Update the DT binding to remove the device name from
> the DT parent node as well as removing the device
> name from the label.  The LED label will be generated
> based off the id name stored in the local driver so
> the LED function can be indicated in the label DT
> entry.

The subject seems incomplete "... with standard ?"

> 
> Also removed the indentation on the example.
> 
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/ams,as3645a.txt       | 36 +++++++++++-----------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Otherwise,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC 04/19] dt: bindings: Add lens-focus binding for image
 sensors
Date: Fri, 28 Jul 2017 10:53:35 +0200
Message-ID: <dcd84739-7e83-e07f-9290-a066013af102@xs4all.nl>
References: <20170718190401.14797-1-sakari.ailus@linux.intel.com>
 <20170718190401.14797-5-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170718190401.14797-5-sakari.ailus@linux.intel.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-leds@vger.kernel.org, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
List-Id: linux-leds@vger.kernel.org

Hi Sakari,

Is the lens-focus phandle specific to voice-coil controllers? What about
motor-controlled focus systems? What when there are multiple motors? E.g.
one for the focus, one for the iris control (yes, we have that).

What if you have two sensors (stereoscopic) controlled by one motor?

Just trying to understand this from a bigger perspective. Specifically
how this will scale when more of these supporting devices as added.

Regards,

	Hans

On 07/18/2017 09:03 PM, Sakari Ailus wrote:
> The lens-focus property contains a phandle to the lens voice coil driver
> that is associated to the sensor; typically both are contained in the same
> camera module.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 9723f7e1c7db..a18d9b2d309f 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -74,6 +74,8 @@ Optional properties
>  - flash: phandle referring to the flash driver chip. A flash driver may
>    have multiple flashes connected to it.
>  
> +- lens-focus: A phandle to the node of the focus lens controller.
> +
>  
>  Optional endpoint properties
>  ----------------------------
> 

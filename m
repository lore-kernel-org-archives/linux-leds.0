From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] Bindings documentation for ISSI is31fl319x driver
Date: Tue, 12 Jul 2016 22:14:46 +0200
Message-ID: <57854FB6.7060303@gmail.com>
References: <cover.1468007377.git.hns@goldelico.com>
 <44b0cd33fc831d55dd7d012c4d4554ed9e2d70f4.1468007377.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <44b0cd33fc831d55dd7d012c4d4554ed9e2d70f4.1468007377.git.hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-Jl6IXVxNIMRxAtABVqVhTwC/G2K4zDHf@public.gmane.org, marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org, letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org, Andrey Utkin <andrey_utkin-97jfqw80gc5Wk0Htik3J/w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Nikolaus,

On 07/08/2016 09:49 PM, H. Nikolaus Schaller wrote:
> Signed-off-by: H. Nikolaus Schaller <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
> ---
>   .../devicetree/bindings/leds/is31fl319x.txt        | 52 ++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/is31fl319x.txt b/Documentation/devicetree/bindings/leds/is31fl319x.txt
> new file mode 100644
> index 0000000..065e78c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/is31fl319x.txt
> @@ -0,0 +1,52 @@
> +LEDs connected to is31fl319x LED controller chip
> +
> +Required properties:
> +- compatible : Should be any of
> +	"issi,is31fl3190"
> +	"issi,is31fl3191"
> +	"issi,is31fl3193"
> +	"issi,is31fl3196"
> +	"issi,is31fl3199"
> +	"si-en,sn3199".
> +- #address-cells: Must be 1.
> +- #size-cells: Must be 0.
> +- reg: 0x64, 0x65, 0x66, 0x67.
> +
> +Optional properties:
> +- led-max-microamp : See Documentation/devicetree/bindings/leds/common.txt.
> +	Valid values: 5000 - 40000, step by 5000 (rounded down)
> +	Default: 20000 (20 mA)
> +- audio-gain-db : audio gain selection for external analog modulation input.
> +	Valid values: 0 - 21, step by 3 (rounded down)
> +	Default: 0
> +
> +Each led is represented as a sub-node of the issi,is31fl319x device.
> +There can be less leds subnodes than the chip can support but not more.
> +
> +LED sub-node properties:
> +- label : (optional) see Documentation/devicetree/bindings/leds/common.txt.
> +- reg : number of LED line
> +	Valid values: 1 - number of leds supported by the chip variant.
> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt.
> +
> +Examples:
> +
> +fancy_leds: leds@65 {
> +	compatible = "issi,is31fl3196";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x65>;
> +
> +	red_aux: led@1 {
> +		label = "red:aux";
> +		reg = <1>;
> +	};
> +
> +	green_power: led@5 {
> +		label = "green:power";
> +		reg = <5>;
> +		linux,default-trigger = "default-on";
> +	};
> +};
> +

You have an extra empty line at the end.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

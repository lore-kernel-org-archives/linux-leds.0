From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 7/8] DT: Add documentation for exynos4-is 'flashes' property
Date: Wed, 10 Jun 2015 11:18:16 -0700
Message-ID: <CAK5ve-LZ0G0H2XpepJ1Bje=Sfv4HNHt1PCu2Mn9HnT4bgXZmuw@mail.gmail.com>
References: <1433754145-12765-1-git-send-email-j.anaszewski@samsung.com> <1433754145-12765-8-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433754145-12765-8-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Jun 8, 2015 at 2:02 AM, Jacek Anaszewski
<j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds a description of 'samsung,camera-flashes'
> property to the samsung-fimc.txt.
>

Please go ahead with my Ack
Acked-by: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../devicetree/bindings/media/samsung-fimc.txt     |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
> index 922d6f8..0554cad 100644
> --- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
> +++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
> @@ -40,6 +40,14 @@ should be inactive. For the "active-a" state the camera port A must be activated
>  and the port B deactivated and for the state "active-b" it should be the other
>  way around.
>
> +Optional properties:
> +
> +- samsung,camera-flashes - Array of pairs of phandles to the camera sensor
> +       devices and flash LEDs respectively. The pairs must reflect the board
> +       configuration, i.e. a sensor has to be able to strobe a flash LED by
> +       hardware. Flash LED is represented by a child node of a flash LED
> +       device (see Documentation/devicetree/bindings/leds/common.txt).
> +
>  The 'camera' node must include at least one 'fimc' child node.
>
>
> @@ -166,6 +174,8 @@ Example:
>                 clock-output-names = "cam_a_clkout", "cam_b_clkout";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&cam_port_a_clk_active>;
> +               samsung,camera-flashes = <&rear_camera &rear_flash>,
> +                                        <&front_camera &front_flash>;
>                 status = "okay";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Fri, 23 Sep 2016 12:29:15 -0500
Message-ID: <20160923172915.GA21731@rob-hp-laptop>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-2-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474025672-5040-2-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Sep 16, 2016 at 01:34:31PM +0200, Florian Vaussard wrote:
> Add device tree binding documentation for On Semiconductor NCP5623 I2C
> LED driver. The driver can independently control the PWM of the 3
> channels with 32 levels of intensity.
> 
> The current delivered by the current source can also be controlled. To
> do so, the led-max-microamp property is used by each LED sub-node. The
> maximum value is then found and used as a limit to compute the final
> intensity of the current source. If a LED happens to have a lower limit,
> the PWM is then used to limit the current to the requested value.
> 
> In order to control the current source, it is also necessary to know
> the current on the Iref pin, hence the onnn,led-iref-microamp property.
> It is usually set using an external bias resistor, following
> Iref = Vref/Rbias with Vref=0.6V.
> 
> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-ncp5623.txt      | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5623.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

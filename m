From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 1/2] dt-bindings: leds: document new trigger-sources
 property
Date: Wed, 14 Jun 2017 10:23:49 -0500
Message-ID: <20170614152349.rdq3ezhpdwqu4iy7@rob-hp-laptop>
References: <20170530092706.927-1-zajec5@gmail.com>
 <20170608160833.1567-1-zajec5@gmail.com>
 <20170608160833.1567-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170608160833.1567-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Jun 08, 2017 at 06:08:31PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> Some LEDs can be related to a specific device(s) described in the DT.
> This property allows specifying such relations. E.g. USB LED should
> usually be used to indicate some USB port(s) state.
> 
> Please note this binding is designed to be generic and not influenced by
> any operating system design. Linux developers may find "trigger" part a
> bit confusing since in Linux triggers are separated drivers. It
> shouldn't define the binding though (we shouldn't add an extra level of
> indirection).
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Replace "usb-ports" with "led-triggers" property which is more generic and
>     allows specifying other devices as well.
> V3: Use "trigger-sources" which is even more accurate as devices aren't
>     precisely triggers.
> V4: Update example to use the correct property
> V5: Document #trigger-source-cells
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 35 +++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

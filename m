From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/25] dt-bindings: leds: Add function and color
 properties
Date: Wed, 27 Mar 2019 19:23:41 -0500
Message-ID: <20190328002341.GB22901@bogus>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-6-jacek.anaszewski@gmail.com>
 <98c1a41e-77bb-5ffd-b5b3-772a28c0f0a6@ti.com>
 <796a13a7-fb8c-9b5b-6bd5-dfb7458731fe@gmail.com>
 <232b6154-cccd-c1f9-80c3-438098f3ab08@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <232b6154-cccd-c1f9-80c3-438098f3ab08@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Mar 12, 2019 at 05:43:11PM +0100, Jacek Anaszewski wrote:
> On 3/11/19 6:24 PM, Jacek Anaszewski wrote:
> > Dan,
> > 
> > On 3/11/19 1:26 PM, Dan Murphy wrote:
> > > On 3/10/19 1:28 PM, Jacek Anaszewski wrote:
> > > > Introduce dedicated properties for conveying information about
> > > > LED function and color. Mark old "label" property as deprecated.
> > > > 
> > > > Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > > Cc: Baolin Wang <baolin.wang@linaro.org>
> > > > Cc: Daniel Mack <daniel@zonque.org>
> > > > Cc: Dan Murphy <dmurphy@ti.com>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> > > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Cc: Simon Shields <simon@lineageos.org>
> > > > ---
> > > >   Documentation/devicetree/bindings/leds/common.txt | 55
> > > > +++++++++++++++++++----
> > > >   1 file changed, 47 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/leds/common.txt
> > > > b/Documentation/devicetree/bindings/leds/common.txt
> > > > index aa1399814a2a..3402b0e1cec9 100644
> > > > --- a/Documentation/devicetree/bindings/leds/common.txt
> > > > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > > > @@ -10,14 +10,23 @@ can influence the way of the LED device
> > > > initialization, the LED components
> > > >   have to be tightly coupled with the LED device binding. They
> > > > are represented
> > > >   by child nodes of the parent LED device binding.
> > > > +
> > > >   Optional properties for child nodes:
> > > >   - led-sources : List of device current outputs the LED is
> > > > connected to. The
> > > >           outputs are identified by the numbers that must be defined
> > > >           in the LED device binding documentation.
> > > > +- function: LED functon. Use one of the LED_FUNCTION_* prefixed
> > > > definitions
> > > > +        from the header include/dt-bindings/leds/common.h.
> > > > +        If there is no matching LED_FUNCTION available, add a new one.
> > > > +- color : Color of the LED. Use one of the LED_COLOR_NAME_*
> > > > prefixed definitions
> > > > +        from the header include/dt-bindings/leds/common.h.
> > > > +        If there is no matching LED_COLOR_NAME available, add a
> > > > new one.
> > > > +
> > > 
> > > I am assuming multi color can re-use this property as well?
> > 
> > I intended it to be a string, but indeed it would be better if we will
> > make it an integer to be consistent with the discussed LED multi color
> > design.
> 
> Going further, I wonder if it would make sense to make function also
> an integer. This way we could enforce use of LED functions known
> to kernel.

I think if we did that, then we'd just need to keep label. I think we 
need to allow for populating a string in DT matching a sticker next to 
an LED on a device.

Rob

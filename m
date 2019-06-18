From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/9] dt: bindings: Add multicolor class dt bindings documention
Date: Tue, 18 Jun 2019 12:57:14 -0600
Message-ID: <CAL_JsqKRLZmZ5uCKWh_tpaYu7eSdYatsymzy+L-D=sesd81w+Q@mail.gmail.com>
References: <20190523190820.29375-1-dmurphy@ti.com> <20190523190820.29375-3-dmurphy@ti.com>
 <20190614170011.GA3277@bogus> <c234361e-f5f7-f8d7-18c6-9cc8ef74ac99@ti.com>
 <CAL_JsqK7u1xXNmwtHjUd7Z5ewHd9_d51quH4zMXxEd63egd28w@mail.gmail.com> <afc7f11f-7f8d-7680-aef3-58c26e8b34fa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <afc7f11f-7f8d-7680-aef3-58c26e8b34fa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Jun 18, 2019 at 12:20 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> On 6/18/19 5:36 PM, Rob Herring wrote:
> > On Fri, Jun 14, 2019 at 11:18 AM Dan Murphy <dmurphy@ti.com> wrote:
> >>
> >> Rob
> >>
> >> Thanks for the review
> >>
> >> On 6/14/19 12:00 PM, Rob Herring wrote:
> >>> On Thu, May 23, 2019 at 02:08:13PM -0500, Dan Murphy wrote:
> >>>> Add DT bindings for the LEDs multicolor class framework.
> >>>>
> >>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>>> ---
> >>>>    .../bindings/leds/leds-class-multicolor.txt   | 97 +++++++++++++++++++
> >>>>    1 file changed, 97 insertions(+)
> >>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> >>>> new file mode 100644
> >>>> index 000000000000..e2a2ce3279cb
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> >>>> @@ -0,0 +1,97 @@
> >>>> +* Multicolor LED properties
> >>>> +
> >>>> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
> >>>> +can be grouped together and also provide a modeling mechanism so that the
> >>>> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
> >>>> +
> >>>> +The nodes and properties defined in this document are unique to the multicolor
> >>>> +LED class.  Common LED nodes and properties are inherited from the common.txt
> >>>> +within this documentation directory.
> >>>> +
> >>>> +Required LED Child properties:
> >>>> +    - color : For multicolor LED support this property should be defined as
> >>>> +              LED_COLOR_ID_MULTI and further definition can be found in
> >>>> +              include/linux/leds/common.h.
> >>>> +
> >>>> +led-controller@30 {
> >>>> +    #address-cells = <1>;
> >>>> +    #size-cells = <0>;
> >>>> +    compatible = "ti,lp5024";
> >>>> +    reg = <0x29>;
> >>>> +
> >>>> +    multi-led@4 {
> >>> Typically we sort by address order.
> >>
> >> These are not addresses these end up being the "module" number that the
> >> LEDs below are associated to.
> >
> > 'reg' (and the unit-address) is an address in the sense that is how
> > you identify a device or sub-device. It doesn't matter what type of
> > 'address' it is, DT practice is to sort node in unit-address numerical
> > order.
> >
> > 'module' is a h/w thing, right? A bank or instance within the device?
> > If not, using 'reg' here is not appropriate.
>
> In this case reg represents LEDn_BRIGHTNESS register which controls
> a group of three LEDs. The thing is that those registers' addresses
> start from 0x07, i.e. the formula for calculating the RGB LED module
> address is: LEDn_BRIGHTNESS = 0x07 + n.
>
>  From the above it seems that we should have multi-led@7 and reg = 0x07
> for LED0_BRIGHTNESS register governing the brightness of RGB LED
> module 0, right?

Use whatever makes the most sense from a h/w perspective. If 'module
N' is something that I'd read about in the datasheet, then I'd stick
with 'N'.

>
> And regarding sorting by address order I think that Rob was asking for
> placing whole multi-led@4 sub-node after multi-led@2 (here sticking to
> the numeration from the patch).

Right.

Rob

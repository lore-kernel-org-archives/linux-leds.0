From: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: pwm-backlight: add a num-interpolation-steps
 property.
Date: Tue, 23 Jan 2018 11:21:57 +0100
Message-ID: <CAFqH_53Mt4wppu3JzGUHhrW9Czn9PqykWtEOzsae=6aqxuw=rA@mail.gmail.com>
References: <20180110223046.17696-1-enric.balletbo@collabora.com>
 <20180110223046.17696-3-enric.balletbo@collabora.com> <20180119205249.fcbdyu6652ffsdmg@rob-hp-laptop>
 <20180122091613.oyjjzwci3mmfc7j2@oak.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122091613.oyjjzwci3mmfc7j2@oak.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

2018-01-22 10:16 GMT+01:00 Daniel Thompson <daniel.thompson@linaro.org>:
> On Fri, Jan 19, 2018 at 02:52:49PM -0600, Rob Herring wrote:
>> On Wed, Jan 10, 2018 at 11:30:44PM +0100, Enric Balletbo i Serra wrote:
>> > The num-interpolated-steps property specifies the number of
>> > interpolated steps between each value of brightness-level table. This is
>> > useful for high resolution PWMs to not have to list out every possible
>> > value in the brightness-level array.
>> >
>> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> > ---
>> >  .../bindings/leds/backlight/pwm-backlight.txt       | 21 +++++++++++++++++++++
>> >  1 file changed, 21 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>> > index 310810906613..605432c910c5 100644
>> > --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>> > +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>> > @@ -21,6 +21,11 @@ Optional properties:
>> >                            and enabling the backlight using GPIO.
>> >    - pwm-off-delay-ms: Delay in ms between disabling the backlight using GPIO
>> >                        and setting PWM value to 0.
>> > +  - num-interpolated-steps: Number of interpolated steps between each value
>> > +                            of brightness-levels table. This way a high
>> > +                            resolution pwm duty cycle can be used without
>> > +                            having to list out every possible value in the
>> > +                            brightness-level array.
>> >
>> >  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
>> >  [1]: Documentation/devicetree/bindings/gpio/gpio.txt
>> > @@ -39,3 +44,19 @@ Example:
>> >             post-pwm-on-delay-ms = <10>;
>> >             pwm-off-delay-ms = <10>;
>> >     };
>> > +
>> > +Example using num-interpolation-steps:
>> > +
>> > +   backlight {
>> > +           compatible = "pwm-backlight";
>> > +           pwms = <&pwm 0 5000000>;
>> > +
>> > +           brightness-levels = <0 65535>;
>> > +           num-interpolated-steps = <4096>;
>>
>> How does this make sense with only 2 defined levels other than having
>> fewer steps? I thought the purpose of this was to have a piecewise
>> linear curve.
>
> It's not wrong as such, this is how a device with a linear (or nearly
> linear) response could be compactly described.
>
> Nevertheless I agree!  An example with a small but realistic curve
> would be better... we know that copy 'n paste exists so I'd rather
> see a simple curve than no curve.
>

Makes sense, I'll put a better example on next series. Thanks for the review.

 - Enric

>
> Daniel.
>
>
>> > +           default-brightness-level = <6>;
>>
>> Aren't valid values 0, 16, 32, 48, etc.?
>>
>> Rob

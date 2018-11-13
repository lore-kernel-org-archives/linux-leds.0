From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Tue, 13 Nov 2018 09:10:56 +0200
Message-ID: <95bcc400-da1a-1334-1f4f-f628eca926b3@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <bdd18dc6-0dee-5957-81d4-39254c7ad74d@gmail.com>
 <be4e75ed-746e-ed55-0bbe-0fd710bd4162@gmail.com>
 <12fb34ec-7175-1ac4-a96e-e1d5d424c9eb@gmail.com>
 <d1ef315d-1216-7e63-f24f-5c6fee8793be@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1ef315d-1216-7e63-f24f-5c6fee8793be@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 12/11/2018 18.02, Jacek Anaszewski wrote:
>>> Support for RGB LEDs, or other variations of LED synchronization
>>> have been approached several times, but without satisfying result
>>> so far.
>>>
>>> Generally the problem boils down to the issue of how triggers
>>> should handle multiple synchronized LED class devices in a backwards
>>> compatible way with monochrome LEDs.
>>>
>>> At some point the HSV [0] approach was proposed, but there was a problem
>>> with getting uniform colors across devices. Especially white.
>>> Certainly a calibration mechanism would be required.
>>>
>>> [0] https://lkml.org/lkml/2017/8/30/423
>>
>> We do not usually use PWM controlled leds so our calibration has been HW
>> engineer tuning the resistors for the leds to get acceptable color for
>> different colors variations.
>>
>> If one wants to have fixed colors for such device then one could use
>> this similar method to define them or/and free form interface to enter
>> RGB values there. Thou with PWM RGB leds you probably want to have more
>> animation there which probably would require some additional support code.
>>
>> One way to do atomic PWM RGB color change with sysfs could be:
>>
>> echo "21 223 242" > color
>>
>> or
>>
>> echo "21 223 242" > rgb
>>
>> or:
>>
>> echo "r:21 g:232 b:242" > color (or something similar)
>>
>> and if there is know registered name then just write it to "color" which
>> would pick registered color rgb values to led instances rgb value.
>>
>> Now for PWM RGB led one could use "brightness" and "rgb" value to
>> calculate actual color with some color space formula (like hsv in [0]).
>>
>> Doing white with RGB LED is a bit hard so usually you want to get RGBW
>> LED (or RGBAW LED) if "real" white is something that is needed. This
>> could then be "rgbw" entry and "color" to pick from fixed set.
>>
>> These presets in device tree for "color" could be considered one way of
>> doing calibration for particular hardware.
>>
>> So in device tree for RGB PWM led it could be like:
>>
>> color-orange {
>>      rgb = <249 197 9>
>> }
>>
>> color-warm-white {
>>      rgb = <255 253 249>
>> }
>>
>> How would that sound like?
> 
> Thank you for the description of your approach.
> 
> Predefined DT color definitions make an interesting option. Nonetheless,
> your design assumes that for RGB LEDs max_brightness would have to be
> always 1.
> 
> While it would solve the issue, it wouldn't allow to benefit from
> the whole potential of RGB LEDs - think of having adjustable "color
> brightness" (like in HSV color model).

What I tried to describe above was that these could also work with HSV 
model also with larger brigtness values too.

Let's say we do following sequence to change from off state to user 
configured intensity value:

# Turn off leds
echo 0 > brightness

# Select requested color
echo "orange" > color

# Use configured LED intensity from user configuration
echo 84 > brightness

Driver would now use rgb value <249 197 9> and brightness <84> to 
calculate (with HSV solution) real PWM values for the led component 
colors. With led controller this is probably easier to get linear 
feedback but for generic PWM controller you may want to utilize PWM 
curve feature like defined for backlight driver.

When thinking this I instantly see my self with thinking PS4's 
sliding/pulsing color animation for orange/blue/white. And controlling 
this animation steps manually from user space probably is not the best 
idea so like with blinking you would need more accurately timed action 
within kernel I suppose (or hardware with the support).

With that idea forward:

# Turning animation sequencer off causes instant changes for values
echo "off" > animation-sequencer

# User 1 second for animation (no effect yet as sequencer is off)
echo 1000 > animation-time-ms (or so)

# Turn off leds (instance change)
echo 0 > brightness

# Select requested color (instant change)
echo "orange" > color

# Change to linear animation sequencer
echo "linear" > animation-sequencer

# Now everything from this point is subject to animation sequencer
# Sequencer remember active state and next state (as seen in sysfs)

# Use configured LED intensity from user configuration (no effect yet)
echo 84 > brightness

# Trigger transition sequence
echo load > animation-sequencer

# This would cause 1 second animation from black to orange with user 
intensivity of 84

# Wait for transition to complete and some extra
sleep 4

# Change color to blue with animation
echo "blue" > color
echo load > animation-sequencer

# This would cause driver to change from orange to blue in current 
intensivity level during 1 second period

# -- end --

Now that went a bit ahead of time but I believe it demonstrates the 
potential for this approach with combined with HSL functionality for future.

> How abut allowing for providing an array of color intensity/brightness
> levels per each color? In the simplest case there could be a single
> level per color, but it should be possible to provide up to 255 levels.

I believe that brightness and color should be separate topics.

We have in our devices option in user interface to configure intesivity 
for backlight and in one device also intensivity for status led (this is 
the only PWM led we have :)). (I believe this might be currently 
implemented without actual led driver and directly use PWM interface)

Even in when reduced intensivity we want the color to be set to 
specified value even thou it would not be as bright as full intensivity 
would be.

What do you think?

Thanks,
Vesa Jääskeläinen

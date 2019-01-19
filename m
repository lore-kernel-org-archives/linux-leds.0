From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Sun, 20 Jan 2019 00:44:15 +0200
Message-ID: <90b9a3f3-c42b-ac65-a6bf-08f94fdff47c@gmail.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
 <efb4e1c1-0d13-bed7-d262-284fc1a0c9ab@gmail.com>
 <4115ad75-22f7-d9ae-c38f-e0ab61fb6655@gmail.com> <20190119214606.GA4712@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119214606.GA4712@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 19/01/2019 23.46, Pavel Machek wrote:
> Hi!
> 
>>> Moreover, I think that RGB LED class with configurable
>>> brightness-model, and with possible color range adjustments via
>>> icc-profiles or something similar, is the best solution that has been
>>> proposed so far. It is just flexible.
>>>
>>> I'd like to capitalize on the ideas shared in this thread and have
>>> finally LED RGB class materialized.
>>>
>>
>> I have now updated my github code with my understanding of the discussion:
>> https://github.com/vesajaaskelainen/linux/tree/wip-multi-color-led
>>
>> Commits:
>> - dt-bindings: leds: Introduce linux,default-brightness-model for all leds
>> https://github.com/vesajaaskelainen/linux/commit/4ffb21d644056686096226bbede7c8c78b0254c2
>> - drivers: leds: Add core support for multi color element LEDs
>> https://github.com/vesajaaskelainen/linux/commit/627f38bb78cebc694b8e6d735fb088c87925435d
>> - dt-bindings: leds: leds-pwm: Introduce multi color element leds support
>> https://github.com/vesajaaskelainen/linux/commit/ef6c5730d621e79ea0b02470caa83bc39439536a
>> - WIP: drivers: leds: leds-pwm: Add multi color element LED support.
>> https://github.com/vesajaaskelainen/linux/commit/0430a27823d9162926424b32c23be1c53eb9cbe2
>>
>> First two commits are common and could be taken before I am happy with the
>> pwm led driver changes. This new conditional feature flag makes it a bit
>> harder. Of course one option would be to require it to be enabled.
>>
>> Current set of concepts:
>> - brightness-model: hardware, onoff, linear
>>    - could be extended in future with other modes like hsv if wanted
> 
> Would it be enough to tell userspace what is relation between values
> it writes and output power?
> 
> Onoff is subset of linear, I guess. We already have max_brightness in
> the API.
> 
>> # Setting up color to not so bright purple with brightness set to 255
>> $ echo "32 0 32 255" > color
> 
>> # Setting up color to a bit brighter purple with brightness
>> $ echo "128 0 128 255" > color
> 
> This would require colorspace conversion in kernel. I have:
> 
>      	    scales = (1., 0.39, 0.11) # for n900
>              val = map(lambda x: int((x**2.2)*255), val)
> 	    (r, g, b) = val
> 
> 	    (r_, g_, b_) = m.scales
> 	    red = r*r_
> 	    ...
> 
> x**2.2 is simplified, real expression is more complex. But it is
> floating point math...
> 
> Do we want to do that?

If we would have range in user space let say 0..255 for components and 
then in devicetree we could define ramp for each of the element like 
what is done for backlight pwm [1] [2].

I believe this would generate same result and user space interface would 
be a bit easier than writing direct pwm/power values.

You could then tune this ramp based on properties of your led. And if 
you ran your software in another device it could behave similarly only 
requiring tuning in devicetree.

For some of our lcd backlights we had generate non-linear ramp 
definition in devicetree to have linearly looking response when user 
configures brightness values from 0-100.

Definition could be something like this in devicetree:

element-red {
	pwms = <&ehrpwm0 0 100000 0>;
	
	brightness-levels = <0 128 256 1024 2048 4096 8192 16384 65535>;
	num-interpolated-steps = <32>;
};

Don't know if better name would actually be in this case "ramp-levels" 
or such. Used pwm-backlights terminology in this example.

[1] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/backlight/pwm_bl.c?h=v5.0-rc2#n253

Thanks,
Vesa Jääskeläinen

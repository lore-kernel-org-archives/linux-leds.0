From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Sun, 20 Jan 2019 08:51:48 +0200
Message-ID: <eeb72aad-6ff1-4744-5c43-ab82593f5df2@gmail.com>
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

Btw. there is slight problem with led trigger framework which is kinda 
visible with "onoff" vs "linear" settings.

If you configure color like:

echo onoff > brightness_model
echo 32 0 32 255 > color

You get not so bright pink color. And if you then enable blinking:

echo heartbeat > trigger

Then it blinks with not so bright pink color as expected.

However if you do it:

echo linear > brightness_model
echo 255 0 255 32 > color

You once again you get not so bright pink color. However when you enable 
blinking:

echo heartbeat > trigger

Then it blinks with very bright pink color.

Reason I believe is because trigger uses either values 0 or 255 for 
brightness when controlling. To fix the issue I believe trigger 
mechanism should be adjusted to allowing one to control ON brightness level.

I would recommend fixing this trigger problem with future patches for it.

Thanks,
Vesa Jääskeläinen

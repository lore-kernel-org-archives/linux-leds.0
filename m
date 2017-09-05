From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to human
 eye
Date: Tue, 5 Sep 2017 12:09:20 +0100
Message-ID: <d9c90a1c-0fb6-db9e-f889-b4df0b5959ca@linaro.org>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 05/09/17 12:05, Daniel Thompson wrote:
> On 04/09/17 16:35, Enric Balletbo i Serra wrote:
>> Dear all,
>>
>> This patch series is a first RFC to know your opinion about implement
>> support to create brightness levels tables dinamically. I tried to argue
>> in every patch the specific reasons we think this can be interesting, to
>> sumup, the idea behind these patches is be able to pass via device tree
>> two parameters to the driver so it can calculate the brightness levels
>> based on the CIE 1931 lightness formula, which is what actually describes
>> how we perceive light.
>>
>> I think that at least the maths involved can be improved, and I've still
>> some doubts. With current code if you create a table with a max PWM
>> value of 255 and 127 steps, the first numbers are repeated so I'm 
>> thinking > that maybe we should skip/remove the repeated values. i.e. 
>> have a table
>> like this,
>>
>> [0, 1, 2, 3  ...  235, 240, 245, 250, 255]
>>
>> instead of
>>
>> [0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3  ...  235, 240, 245, 250, 255]
>>
>> Well, I know there are things to improve but lets see your feedback first
>> before dedicate more time on it. The patches were tested on a couple of
>> devices but I'll test on more devices meanwhile we discuss about it.
> 
> I'm not fully decided on this one but my initial reaction isn't to 
> question the concept so much as to ask why the number of levels should 
> go in the devicetree at all! We could just make brightness-levels 
> optional and get the driver to pick sane curves by default.
> 
> I'm sure we can debate what "sane" means for a couple of e-mails yet but 
> in principle, given it knows the PWM max counter value, the driver 
> should be able to calculate the "right" number of steps too. If we have 
> that your core code remains but we don't have to complexify the device

... tree

Sorry. ;-)


Daniel.


> 
> <strawman>
> Basically we prefer X (?100 like some of the Intel DRM drivers do for 
> connector properties?) steps but we reduce the number of steps if the 
> PWM is rather course and we can't get sufficiently different steps.
> </strawman>
> 
> I guess the summary of what I'm saying is that if we can 
> programmatically derive brightness curves then the number of steps is 
> not really a property of the hardware and doesn't belong in devicetree.
> 
> 
> Daniel.

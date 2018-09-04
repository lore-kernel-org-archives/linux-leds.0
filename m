From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v7 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 4 Sep 2018 21:38:13 +0200
Message-ID: <e6cf7c2d-917a-b05f-178c-012c6b4161cf@gmail.com>
References: <e6d4e7be537a4e4d6fce26c6d446703b1910eab9.1535700092.git.baolin.wang@linaro.org>
 <ef266d4a-ba0e-cba6-ae30-ebbf730e28a2@gmail.com> <20180903215323.GA21489@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903215323.GA21489@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: bjorn.andersson@linaro.org, Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 09/03/2018 11:53 PM, Pavel Machek wrote:
> Hi!
> 
>>> +static int pattern_trig_start_pattern(struct led_classdev *led_cdev)
>>> +{
>>> +	struct pattern_trig_data *data = led_cdev->trigger_data;
>>> +
>>> +	if (!data->npatterns)
>>> +		return 0;
>>> +
>>> +	if (data->is_hw_pattern) {
>>> +		return led_cdev->pattern_set(led_cdev, data->patterns,
>>> +					     data->npatterns, data->repeat);
>>> +	}
>>
>> I have doubts here if it is a good idea to enforce array of tuples
>> as a generic interface for all hw_patterns. It may not fit well for
>> every hw pattern engine. It seems that the only feasible solution will
>> be allowing drivers to come up with their own interfaces, i.e. the
>> approach you proposed at first for your driver. It seems that the
>> ledtrig-pattern with software pattern mechanism will be just
>> a nice side effect of this series :-)
>>
>> Unless someone will propose a better solution.
> 
> I believe array of tuples will work for everyone. It is just a LED, it
> can change intensity over time.

We have an example of different semantics in case of hw pattern
for leds-sc27xx-bltc.c, from this patch set.

Proposed hw_pattern ABI documentation:

+What:		/sys/class/leds/<led>/hw_pattern
+Date:		September 2018
+KernelVersion:	4.20
+Description:
+		Specify a hardware pattern for the SC27XX LED. For the SC27XX
+		LED controller, it only supports 4 hardware patterns to configure
+		the low time, rise time, high time and fall time for the breathing
+		mode, and each stage duration unit is 125ms. So the format of
+		the hardware pattern values should be:
+		"brightness_1 duration_1 brightness_2 duration_2 brightness_3
+		duration_3 brightness_4 duration_4".

In this case low time and high time can be easily described with
use of the proposed [brightness delta_t] tuples. It is not equally
obvious in case of rise time and fall time.

I can imagine hw pattern that would require defining blink rate
over period of time, or blink rate during rise/fall time - in the
latter case we would have odd number of pattern components. Probably
it wouldn't be a big deal, we'd need one "padding" value, but still
there's room for improvement IMHO.

>> We need a broader consensus here. I'd like to hear Pavel's opinion,
>> since he's been always in favor of common pattern interface, and
>> inspired this work.
> 
> I believe Baolin did good work here. I believe it will cover most, if
> not all, hardware engines out there. I think we should merge it, and
> see what happens -- it should be good enough.
> 
> (Yes, there's still more work to do, but that will be stuff like RGB
> LED synchronization.)
> 
> (And yes, one of the LED chip has pattern engine that can compute
> prime numbers on its own. I don't expect to support
> _that_. Fortunately, nobody but me is likely to want that pattern, so
> we are still okay :-) 
> 
> https://gitlab.com/tui/tui/blob/master/ofone/tests.notcc/primes.nc
> 
> )
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski

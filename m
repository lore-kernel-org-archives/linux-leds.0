From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Sun, 2 Apr 2017 14:54:57 +0200
Message-ID: <1192806d-13bf-3b5c-4179-b7795737ed40@gmail.com>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd> <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux> <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux> <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 03/31/2017 11:28 AM, Jacek Anaszewski wrote:
> Hi Bjorn and Pavel,
> 
> On 03/30/2017 09:43 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>> There is a binding for ti,lp55xx, but there's nothing I can reuse from
>>>>> that binding...because it's completely different hardware.
>>>>
>>>> Agreed, if you drop the pattern stuff from the binding, at least for now. 
>>>
>>> I do not have a strong preference to expose these knobs in devicetree
>>> and I do fear that finding some common "pattern" bindings that suits
>>> everyone will be very difficult.
>>>
>>> So I'll drop them from the binding for now.
>>
>> Ok.
>>
>>>> If you want driver merged quickly, I believe the best way would be to
>>>> leave out pattern support for now. We can merge the basic driver
>>>> easily to 4.12.
>>>>
>>>
>>> I'm not that much in a hurry and would rather see that we resolve any
>>> outstanding issues with the implementation of the pattern handling.
>>
>> Ok, good.
>>
>>> But regardless of this we still have the problem that the typical
>>> Qualcomm PMIC has 8 LPG-blocks and any triple could be driving a
>>> RGB-LED. So we would have to create some sort of in-driver-wrapper
>>> around any three instances exposing them as a single LED to the user.
>>
>> Yes, I believe we should do the wrapping. In N900 case, 
>>
>>> I rather expose the individual channels and make sure that when we
>>> trigger a blink operation or enable a pattern (i.e. the two operations
>>> that do require synchronization) we will perform that synchronization
>>> under the hood.
>>
>> First, we need a way to tell userspace which LEDs are synchronized,
>> because otherwise it will be confusing.
> 
> There is one year old discussion [0] about the possible approaches
> to RGB sub-LEDs synchronization problem and patterns in general.
> My last message with API design proposal has been left unanswered.
> 
> Probably we continue that discussion here.
> 
> Generally Bjorn's drivers touch two yet to be addressed issues:
> - RGB LED support
> - Generic support for patterns
> 
> It is likely that both issues can be solved by utilizing trigger
> mechanism. The possible solution to the problem Bjorn tried to
> address with /sys/class/leds/<led>/pattern comma separated list
> could be a trigger with adjustable number of pattern intervals.
> 
> The trigger once activated would create a directory with the
> number of files corresponding to the number of requested intervals,
> and then user could write an interval value by writing it to the
> corresponding file. Somehow related approach has been implemented
> for USB port LED trigger:
> 
> 0f247626cbbf ('usb: core: Introduce a USB port LED trigger")
> 
> In both RGB and pattern approaches we should assess
> if it is acceptable to provide a pattern for trigger name,
> e.g. blink-pattern-{num_intervals}.

Actually we could achieve the goal by listing all available pattern
configurations for given LED class device, so in case of Qualcomm LPG
driver we could have transition-pattern-1 to transition-pattern-15
listed after executing "cat trigger".

In case of RGB trigger we would have qcom-rgb among other triggers
listed in a result of executing "cat trigger". Then qcom-rgb-1 LED class
device could appear in /sys/class/leds, which would expose files
red-led-name, green-led-name and blue-led-name. Once all files are
initialized with appropriate LED class device names the RGB brightness
could be updated synchronously in all involved LEDs by executing
e.g. "echo 1 > update_color". Of course all LEDs that set qcom-rgb
trigger would have to avoid changing device state on write to
their brightness file.

I wonder if I'm not missing some vital constraints here that could
make this design unfeasible.

Best regards,
Jacek Anaszewski

> If so, then "echo transition-pattern-15" would create a directory
> e.g. transition_intervals with files interval_0 to interval_14,
> that could be adjusted by userspace.
> 
>> Second, there are more issues than just patterns with the RGB
>> LED. Most important is ability to set particular colors. You want to
>> set the RGB LED to "white", but that does not mean you can set
>> red=green=blue=1.0. You want color to look the same on LCD and on the
>> LED, which means coefficients for white and some kind of function for
>> brightness-to-PWM conversion.
> 
> Shouldn't we leave that entirely to the userspace? Can we come up
> with coefficients that will guarantee the same result on all existing
> LCD devices?
> 
>>>> Incremental patches sound like a good idea, yes.
>>>>
>>>> I'd say that testing with actual RGB LED is not a requirement... as
>>>> long as we design reasonable interface where the synchronizaction will
>>>> be easy.
>>>>
>>>
>>> As this relates to the board layout (which LPG-channels are hooked to a
>>> RGB) I think it makes sense to expose a mechanism in devicetree to
>>> indicate which channels should have their pattern/blink synchronized.
>>>
>>> We should be able to extend the LUT (the hardware that actually
>>> implements the pattern-walker logic) with a DT-property like:
>>>
>>>   qcom,synchronize-group-0 = <1, 2, 3>;
>>>   qcom,synchronize-group-1 = <5, 6, 7>;
>>>
>>> And whenever we configure a pattern involving one of the affected LEDs
>>> from a group we start all of them.
>>
>> Yes we need some kind of grouping.
>>
>> Additional complexity in the N900 case... groups can actually be
>> configured at run time. Original Maemo used that ability to group 6
>> keyboard backlight leds, and then run pattern on them. OTOH... I don't
>> think we _need_ to support that functionality.
>>
>> Best regards,
>> 									Pavel
>>
> 
> [0] https://lkml.org/lkml/2016/4/18/179
> 

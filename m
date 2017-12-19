From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Tue, 19 Dec 2017 22:30:59 +0100
Message-ID: <1cab3297-bda5-6ac7-cf1a-fb7cbe55192f@gmail.com>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-4-bjorn.andersson@linaro.org>
 <a97a6cd3-b624-5127-003d-7ffd7d9d67e9@gmail.com>
 <20171120195812.GY28761@minitux>
 <196a3b05-7577-660c-9d5c-0cb9c0b72e77@gmail.com>
 <20171120214550.GA28761@minitux>
 <72744adc-6ad4-a51f-51c0-2f5bc2fac8bd@gmail.com>
 <20171218204913.GA1920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35427 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751305AbdLSVb5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Dec 2017 16:31:57 -0500
In-Reply-To: <20171218204913.GA1920@tuxbook>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

On 12/18/2017 09:49 PM, Bjorn Andersson wrote:
> On Wed 22 Nov 12:42 PST 2017, Jacek Anaszewski wrote:
> 
>> On 11/20/2017 10:45 PM, Bjorn Andersson wrote:
>>> On Mon 20 Nov 12:35 PST 2017, Jacek Anaszewski wrote:
>>>
>>>> On 11/20/2017 08:58 PM, Bjorn Andersson wrote:
>>>>> On Sun 19 Nov 13:35 PST 2017, Jacek Anaszewski wrote:
>>>>>
>>>>>> Hi Bjorn,
>>>>>>
>>>>>> Thanks for the update.
>>>>>>
>>>>>> On 11/15/2017 08:13 AM, Bjorn Andersson wrote:
>>>>>>> This adds the binding document describing the three hardware blocks
>>>>>>> related to the Light Pulse Generator found in a wide range of Qualcomm
>>>>>>> PMICs.
>>>>>>>
>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes since v2:
>>>>>>> - Squashed all things into one node
>>>>>>> - Removed quirks from the binding, compatible implies number of channels, their
>>>>>>>   configuration etc.
>>>>>>> - Binding describes LEDs connected as child nodes
>>>>>>> - Support describing multi-channel LEDs
>>>>>>> - Change style of the binding document, to match other LED bindings
>>>>>>>
>>>>>>> Changes since v1:
>>>>>>> - Dropped custom pattern properties
>>>>>>> - Renamed cell-index to qcom,lpg-channel to clarify its purpose
>>>>>>>
>>>>>>>  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 66 ++++++++++++++++++++++
>>>>>>>  1 file changed, 66 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..9cee6f9f543c
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>>>> @@ -0,0 +1,66 @@
>>>>>>> +Binding for Qualcomm Light Pulse Generator
>>>>>>> +
>>>>>>> +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
>>>>>>> +a ramp generator with lookup table, the light pulse generator and a three
>>>>>>> +channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
>>>>>>> +
>>>>>>> +Required properties:
>>>>>>> +- compatible: one of:
>>>>>>> +	      "qcom,pm8916-pwm",
>>>>>>> +	      "qcom,pm8941-lpg",
>>>>>>> +	      "qcom,pm8994-lpg",
>>>>>>> +	      "qcom,pmi8994-lpg",
>>>>>>> +	      "qcom,pmi8998-lpg",
>>>>>>> +
>>>>>>> +Optional properties:
>>>>>>> +- qcom,power-source: power-source used to drive the output, as defined in the
>>>>>>> +		     datasheet. Should be specified if the TRILED block is
>>>>>>> +		     present
>>>>>>
>>>>>> Range of possible values is missing here.
>>>>>>
>>>>>
>>>>> There seems to be a 4-way mux in all variants, but the wiring is
>>>>> different in the different products. E.g. in pm8941 1 represents VPH_PWR
>>>>> while in pmi8994 this is pulled from a dedicated pin named VIN_RGB.
>>>>>
>>>>> Would you like me to list the 4 options for each compatible?
>>>>
>>>> Could you please explain why user would prefer one power source
>>>> over the other? Is it that they have different max current limit?
>>>>
>>>
>>> The mux in pm8941 is connected to ground (0V), vph_pwr (3.6V), internal
>>> 5V and min(5V, charger). In pmi8994 it's ground, vdd_rgb (a dedicated
>>> pin) and 4.2V. PMI8998 is a slight variation of PMI8994 and I expect
>>> there to be more variants.
>>>
>>> So it's different voltage level and, potentially, current limit.
>>
>> I'd replace this property with led-max-microamp
>> (see Documentation/devicetree/bindings/leds/common.txt) and let
>> the driver to decide which power source to choose, basing on that limit.
>>
> 
> Unfortunately I don't think specifying this in uA is possible, at least
> some of these inputs does not have a knows (at least not platform
> defined) current limit.
> 
> Like in the case on PM8941, the knobs this property tweaks is: "should
> we output 3.6V or 5V" and both values depend on external power-supplies.
> 
> For most cases specifying this as led-microvolt would be possible, but
> then there are the levels that are min(5V, charger).
> 
> 
> One thing we've done in some other drivers with similar "enum" like
> types is to provide an dt-bindings include file with these constants.
> This makes the dts self documented and doesn't require additional
> translation of the values.

Sounds good.

>>> [..]
>>>> One more question regarding TRILED - in your design it will be
>>>> exposed as a single LED class device with one brightness file,
>>>> right? Does it mean that all three LEDs will be applied the
>>>> same brightness after writing it to the sysfs file?
>>>>
>>>
>>> Correct, each LED described in DT will become one LED and can have more
>>> than one (any number of) physical channel associated. The current
>>> implementation applies the same brightness (and pattern) to all channels
>>> associated with a LED.
>>
>> The rgb DT node name would be a bit misleading in this case, since
>> RGB usually implies the possibility of having different intensity
>> of each color.
>>
> 
> In the sense of the devicetree this is exactly what it describes, the
> fact that we haven't figured out a way to implement this is, in my view,
> a separate topic.

Indeed, I was just looking at it from the LED ABI POV.

>>> The open question is still how to pass a color from user space, the
>>> brightness_set and pattern_set would need to be modified to map a list
>>> of brightnesses to the individual channels or to adapt the brightness by
>>> some color-modifier(?).
>>
>> Pavel made and attempt of reworking Heiner Kallweit's HSV approach
>> few months ago [0]. You can take a look and share your opinion
>> or even continue this effort.
>>
> 
> I did not consider using HSV to get around the problem of everything
> operating on "brightness", but this seems like a quite nice solution.
> 
> In the case of lpg_brightness_set() this would map nicely into the case
> where a LED is either a single channel or three channels, and until we
> land those patches the driver would just implement H = S = 0.
> 
> And for the pattern setting, we can retain the proposed interface of
> pattern being a sequence of brightness/delay values and then map this in
> the driver as we apply the patterns.

Yes, the HSV approach would be very nice especially due to its
compatibility with monochrome LEDs. We will however need to allow
for defining suitable coefficients for adjusting HSV values,
so that the perceived color matched the expected one.

-- 
Best regards,
Jacek Anaszewski

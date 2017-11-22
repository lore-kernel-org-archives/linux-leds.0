From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Wed, 22 Nov 2017 21:42:55 +0100
Message-ID: <72744adc-6ad4-a51f-51c0-2f5bc2fac8bd@gmail.com>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-4-bjorn.andersson@linaro.org>
 <a97a6cd3-b624-5127-003d-7ffd7d9d67e9@gmail.com>
 <20171120195812.GY28761@minitux>
 <196a3b05-7577-660c-9d5c-0cb9c0b72e77@gmail.com>
 <20171120214550.GA28761@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120214550.GA28761@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On 11/20/2017 10:45 PM, Bjorn Andersson wrote:
> On Mon 20 Nov 12:35 PST 2017, Jacek Anaszewski wrote:
> 
>> On 11/20/2017 08:58 PM, Bjorn Andersson wrote:
>>> On Sun 19 Nov 13:35 PST 2017, Jacek Anaszewski wrote:
>>>
>>>> Hi Bjorn,
>>>>
>>>> Thanks for the update.
>>>>
>>>> On 11/15/2017 08:13 AM, Bjorn Andersson wrote:
>>>>> This adds the binding document describing the three hardware blocks
>>>>> related to the Light Pulse Generator found in a wide range of Qualcomm
>>>>> PMICs.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>> ---
>>>>>
>>>>> Changes since v2:
>>>>> - Squashed all things into one node
>>>>> - Removed quirks from the binding, compatible implies number of channels, their
>>>>>   configuration etc.
>>>>> - Binding describes LEDs connected as child nodes
>>>>> - Support describing multi-channel LEDs
>>>>> - Change style of the binding document, to match other LED bindings
>>>>>
>>>>> Changes since v1:
>>>>> - Dropped custom pattern properties
>>>>> - Renamed cell-index to qcom,lpg-channel to clarify its purpose
>>>>>
>>>>>  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 66 ++++++++++++++++++++++
>>>>>  1 file changed, 66 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>> new file mode 100644
>>>>> index 000000000000..9cee6f9f543c
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>> @@ -0,0 +1,66 @@
>>>>> +Binding for Qualcomm Light Pulse Generator
>>>>> +
>>>>> +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
>>>>> +a ramp generator with lookup table, the light pulse generator and a three
>>>>> +channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible: one of:
>>>>> +	      "qcom,pm8916-pwm",
>>>>> +	      "qcom,pm8941-lpg",
>>>>> +	      "qcom,pm8994-lpg",
>>>>> +	      "qcom,pmi8994-lpg",
>>>>> +	      "qcom,pmi8998-lpg",
>>>>> +
>>>>> +Optional properties:
>>>>> +- qcom,power-source: power-source used to drive the output, as defined in the
>>>>> +		     datasheet. Should be specified if the TRILED block is
>>>>> +		     present
>>>>
>>>> Range of possible values is missing here.
>>>>
>>>
>>> There seems to be a 4-way mux in all variants, but the wiring is
>>> different in the different products. E.g. in pm8941 1 represents VPH_PWR
>>> while in pmi8994 this is pulled from a dedicated pin named VIN_RGB.
>>>
>>> Would you like me to list the 4 options for each compatible?
>>
>> Could you please explain why user would prefer one power source
>> over the other? Is it that they have different max current limit?
>>
> 
> The mux in pm8941 is connected to ground (0V), vph_pwr (3.6V), internal
> 5V and min(5V, charger). In pmi8994 it's ground, vdd_rgb (a dedicated
> pin) and 4.2V. PMI8998 is a slight variation of PMI8994 and I expect
> there to be more variants.
> 
> So it's different voltage level and, potentially, current limit.

I'd replace this property with led-max-microamp
(see Documentation/devicetree/bindings/leds/common.txt) and let
the driver to decide which power source to choose, basing on that limit.

> [..]
>> One more question regarding TRILED - in your design it will be
>> exposed as a single LED class device with one brightness file,
>> right? Does it mean that all three LEDs will be applied the
>> same brightness after writing it to the sysfs file?
>>
> 
> Correct, each LED described in DT will become one LED and can have more
> than one (any number of) physical channel associated. The current
> implementation applies the same brightness (and pattern) to all channels
> associated with a LED.

The rgb DT node name would be a bit misleading in this case, since
RGB usually implies the possibility of having different intensity
of each color.

> The open question is still how to pass a color from user space, the
> brightness_set and pattern_set would need to be modified to map a list
> of brightnesses to the individual channels or to adapt the brightness by
> some color-modifier(?).

Pavel made and attempt of reworking Heiner Kallweit's HSV approach
few months ago [0]. You can take a look and share your opinion
or even continue this effort.

> I've tested the driver on single-LEDs and on RGB-leds and it supports
> both, the latter with pulse pattern synchronized over the 3 channels.
> So I'm hoping that we can move forward with merging the driver with this
> limitation and then discuss the RGB interface in LED-class separately.

Agreed.

[0] https://lkml.org/lkml/2017/8/30/423

-- 
Best regards,
Jacek Anaszewski

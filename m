From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/2] dt: bindings: lm3601x: Introduce the lm3601x
 driver
Date: Fri, 11 May 2018 22:27:49 +0200
Message-ID: <2dd155f5-ce82-88b2-699e-897ef7d55fee@gmail.com>
References: <20180510174717.26540-1-dmurphy@ti.com>
 <20180510185401.GB12846@amd> <80e7346f-e8cd-79d2-6d4e-d638c2be01eb@ti.com>
 <dc3dfb5b-92a9-54bc-b93b-804e64bd8a66@ti.com>
 <fd68c674-f842-5877-698a-3a74922cb384@gmail.com>
 <10ab412f-7206-2a01-9876-2a8beeec2287@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10ab412f-7206-2a01-9876-2a8beeec2287@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, afd@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

On 05/11/2018 02:12 PM, Dan Murphy wrote:
> Jacek
> 
> Thanks for the review
> 
> On 05/10/2018 03:17 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> On 05/10/2018 09:10 PM, Dan Murphy wrote:
>>> On 05/10/2018 02:06 PM, Dan Murphy wrote:
>>>> Pavel
>>>>
>>>> On 05/10/2018 01:54 PM, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>> Introduce the device tree bindings for the lm3601x
>>>>>> family of LED torch, flash and IR drivers.
>>>>>>
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>
>>>>> Better, thanks.
>>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
>>>>>> @@ -0,0 +1,50 @@
>>>>>> +* Texas Instruments - lm3601x Single-LED Flash Driver
>>>>>
>>>>> Ok, so is it single-LED driver, or can it driver ir & white LEDs at
>>>>> the same time?
>>>>
>>>> It is a single LED driver.  It can drive a Torch white LED or IR LED indefinitely or if the driver
>>>> is programmed to strobe mode the driver will drive the configured LED for the flash timeout specified.
>>>>
>>>> Basically a flash and a flash light. IR or White LED.
>>>>
>>>>
>>>>>
>>>>>> +Example:
>>>>>> +led-controller@64 {
>>>>>> +    compatible = "ti,lm36010";
>>>>>> +    #address-cells = <1>;
>>>>>> +    #size-cells = <0>;
>>>>>> +    reg = <0x64>;
>>>>>> +
>>>>>> +    led@0 {
>>>>>> +        reg = <0>;
>>>>>> +        label = "white:torch";
>>>>>> +        led-max-microamp = <10000>;
>>>>>> +    };
>>>>>> +
>>>>>> +    led@1 {
>>>>>> +        reg = <1>;
>>>>>> +        label = "white:flash";
>>>>>> +        flash-max-microamp = <10000>;
>>>>>> +        flash-max-timeout-us = <800>;
>>>>>> +    };
>>>>>
>>>>> Is this realistic config? I'd expect flash to use more power than
>>>>> torch, and would expect longer timeout than 0.8msec.
>>>>
>>>> Timeout in the spreadsheet is ms I will update this example and code
>>>> Current in the spreadsheet is mA I will update this example and code
>>>>
>>>>>
>>>>> Also.. if this is physically one white LED, it should not be
>>>>> spread over reg = <0> and reg = <1>...
>>>>
>>>> If the torch LED and strobe LED are the same LED how do I expose them both to the user.
>>>> It is up to consumer to configure the required interfaces they want to expose to the filesystem.
>>
>> LED flash class interface is prepared for it.
>> led_clasdev_flash_register() internally calls led_classdev_register(),
>> so there is brightness file available for torch related operations.
> 
> Yes the flash class may handle this and expose the brightness node but the HW has two different registers to set the
> corresponding brightness so one set brightness node does not work.
> There is no way to differentiate between the strobe brightness (register 4) and the torch brightness (register 3).

Hmm? There is brightness file (with brightness_set{_blocking} op) from
LED class and flash_brightness file (with flash_brightness_set op) from
LED class flash.

I've only now realized that you're not using flash_brightness_set op for
the "strobe_node" in your driver. I assume that you overlooked it.
Please don't introduce "strobe_brightness" naming convention - we
already have "flash_brightness" for that.

> When the enable register is written the driver will read the corresponding register and set
> the current for the LED.
> 
> This is why I separated out the strobe from the torch into 2 different LED nodes.
> 
> I cannot seem to find the data sheet on line for the max77693 so I cannot verify that the device only has
> a single brightness register for both torch and strobe.

It wasn't openly available at least at the time when I had an access
to it.

But - please look at the functions max77693_set_torch_current() and
max77693_set_flash_current(). The device has separate registers
for torch and flash brightnesses.

>>>> Maybe they don't want the strobe feature and just want LED on/off and switch between IR and White.
>>>>
>>>> The IR is driven via a different output pin.
>>>
>>> Correction.  There is only one LED drive pin.  The mode selected determines how the device will drive the
>>> LED.  So you may have one device to drive a Torch and another device to drive the LED.
>>
>> But only one type of LED can be soldered on the board at a time, right?
>> If yes, then this is clearly a DT related configuration, and only
>> one child DT node should be defined for given board.
> 
> But see above.  There is not a clean way to expose the torch/ir and strobe separately.
> 
> Dan
> 
> 
>>
>>> Strobe is available in either case but not always required if strobe is not desired by the customer hence
>>> why I have a separate DT node for it.
>>>
>>> Dan
>>>
>>>>
>>>> Dan
>>>>
>>>>>
>>>>> Best regards,
>>>>>                                      Pavel
>>>>>
>>>>
>>>>
>>>
>>>
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski

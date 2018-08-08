From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 16:50:59 -0500
Message-ID: <65e927b4-8bd2-1f34-3422-36ce21f674c3@ti.com>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd> <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
 <20180808210215.GA15831@amd> <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
 <20180808210926.GC15831@amd> <cdf671fa-674d-6e34-177e-c0e9cb4f6137@ti.com>
 <20180808214527.GE15831@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808214527.GE15831@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 08/08/2018 04:45 PM, Pavel Machek wrote:
> On Wed 2018-08-08 16:41:16, Dan Murphy wrote:
>> On 08/08/2018 04:09 PM, Pavel Machek wrote:
>>> On Wed 2018-08-08 16:04:43, Dan Murphy wrote:
>>>> On 08/08/2018 04:02 PM, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>>>> +	- #size-cells : 0
>>>>>>>> +	- control-bank-cfg - : Indicates which sink is connected to which control bank
>>>>>>>> +		0 - All HVLED outputs are controlled by bank A
>>>>>>>> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by bank A
>>>>>>>> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by bank A
>>>>>>>> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by bank A
>>>>>>>> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by bank A
>>>>>>>> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by bank A
>>>>>>>> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are controlled by bank B
>>>>>>>> +		7 - All HVLED outputs are controlled by bank B
>>>>>>>
>>>>>>> This is quite long way to describe a bitmask, no? Could we make
>>>>>>> it so that control-bank-cfg is not needed?
>>>>>>
>>>>>> The problem we have here is there is a potential to control
>>>>>> 3 different LED string but only 2 sinks.  So control bank A can control 2 LED strings and control
>>>>>> bank b can control 1 LED string.  
>>>>>>
>>>>>
>>>>> Can we forget about the LED strings, and just expose the sinks as
>>>>> Linux LED devices?
>>>>
>>>> 2 sinks 3 LED strings.  How do you know which LED string is which and what bank it belongs
>>>> to when setting the brightness.  Each Bank has a separate register for brightness control.
>>>
>>> Yes, and LED strings are statically assigned to banks, right?
>>>
>>> So why not simply forget about LED strings for sake of hw
>>> abstractions, and work just with banks?
>>
>> How would you set the control bank register for the correct LED string configuration?
> 
> Have property at each LED saying which which HVLEDs it controls?

Isn't that what I have already using the reg property?

Then we would have to aggregate the configuration and make a determination in the driver.

But that does not follow the LED child node ideology.
Each output of the LED driver should have a child node.

In this case the outputs are the sinks(inputs) and there are only 2 sinks so having 3 LED child nodes would be confusing
and there are required properties for each child like label.

Each child node would then need to present 1 LED node to the user space to control the LED string.  Which would
be technically incorrect because you would have 2 LED nodes controlling the same control bank sink.

> 
> 									Pavel
> 


-- 
------------------
Dan Murphy

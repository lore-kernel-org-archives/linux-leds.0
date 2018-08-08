From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 23:09:49 +0200
Message-ID: <53691469-4554-42a8-c182-762c1a3939b7@gmail.com>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd> <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
 <20180808210215.GA15831@amd> <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On 08/08/2018 11:04 PM, Dan Murphy wrote:
> On 08/08/2018 04:02 PM, Pavel Machek wrote:
>> Hi!
>>
>>>>> +	- #size-cells : 0
>>>>> +	- control-bank-cfg - : Indicates which sink is connected to which control bank
>>>>> +		0 - All HVLED outputs are controlled by bank A
>>>>> +		1 - HVLED1 is controlled bank B, HVLED2/3 are controlled by bank A
>>>>> +		2 - HVLED2 is controlled bank B, HVLED1/3 are controlled by bank A
>>>>> +		3 - HVLED1/2 are controlled by bank B, HVLED3 is controlled by bank A
>>>>> +		4 - HVLED3 is controlled by bank B, HVLED1/2 are controlled by bank A
>>>>> +		5 - HVLED1/3 is controlled by bank B, HVLED2 is controlled by bank A
>>>>> +		6 - (default) HVLED1 is controlled by bank A, HVLED2/3 are controlled by bank B
>>>>> +		7 - All HVLED outputs are controlled by bank B
>>>>
>>>> This is quite long way to describe a bitmask, no? Could we make
>>>> it so that control-bank-cfg is not needed?
>>>
>>> The problem we have here is there is a potential to control
>>> 3 different LED string but only 2 sinks.  So control bank A can control 2 LED strings and control
>>> bank b can control 1 LED string.  
>>>
>>
>> Can we forget about the LED strings, and just expose the sinks as
>> Linux LED devices?
> 
> 2 sinks 3 LED strings.  How do you know which LED string is which and what bank it belongs
> to when setting the brightness.  Each Bank has a separate register for brightness control.

Just a blind shot, without going into details - could you please check
if led-sources property documented in the common LED bindings couldn't
help here?

-- 
Best regards,
Jacek Anaszewski

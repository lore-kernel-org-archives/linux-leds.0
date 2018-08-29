From: kgunda@codeaurora.org
Subject: Re: [PATCH V5 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Wed, 29 Aug 2018 11:22:08 +0530
Message-ID: <a32ac1da9453d45be3f70496fc6fe82b@codeaurora.org>
References: <1535106467-17843-1-git-send-email-kgunda@codeaurora.org>
 <1535106467-17843-4-git-send-email-kgunda@codeaurora.org>
 <20180827100143.GE31905@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827100143.GE31905@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 2018-08-27 15:31, Pavel Machek wrote:
> Hi!
> 
> On Fri 2018-08-24 15:57:42, Kiran Gunda wrote:
>> Update the bindings with the new properties used for
>> PMI8998.
> 
>> Changes from V3:
>>     - Removed the default values.
> 
> Why?
> 
As per Bjorn's comment I have removed the default values.
Do you want to add them back ?

>> +- qcom,current-limit-microamp
>> +	Usage:        optional
>> +	Value type:   <u32>
>> +	Definition:   uA; per-string current limit; value from 0 to 30000 
>> with
>> +		      2500 uA step.
>> 
>>  - qcom,current-boost-limit
>>  	Usage:        optional
>>  	Value type:   <u32>
>>  	Definition:   mA; boost current limit.
>>  		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
>> -		      1680. Default: 805 mA
>> +		      1680.
>>  		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
>> -		      1500. Default: 970 mA
>> +		      1500.
>> 
> 
> I'd say that optional properties should list default values...?
> 
Same as above.

>>  - qcom,ovp
>>  	Usage:        optional
>>  	Value type:   <u32>
>>  	Definition:   V; Over-voltage protection limit; one of:
>> -		      27, 29, 32, 35. default: 29V
>> +		      27, 29, 32, 35.
>>  		      This property is supported only for PM8941.
>> 
> 
> Same here.
> 
Same as above.
>> +- qcom,ovp-millivolt
>> +	Usage:        optional
>> +	Value type:   <u32>
>> +	Definition:   mV; Over-voltage protection limit;
>> +		      For pmi8998: one of 18100, 19600, 29600, 31100
>> +		      If this property is not specified for PM8941, it
>> +		      falls back to "qcom,ovp" property.
>> +
> 
> "voltage-limit-millivolt"? "ovp" is not really well known acronym.
> 									Pavel
"ovp" is already being used in pm8941-wled.c driver. That's why I am 
using ovp-millivolt.
If I rename this, i think I have to rename the existing "qcom,ovp" also, 
which will break
the backward compatibility.

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 05/24] dt-bindings: sc27xx-blt: Add function and color
 properties
Date: Sun, 11 Nov 2018 21:03:28 +0100
Message-ID: <c6e09153-eb16-640f-3ebe-81b533408a73@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-6-git-send-email-jacek.anaszewski@gmail.com>
 <20181111142941.GA5215@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111142941.GA5215@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Xiaotong Lu <xiaotong.lu@spreadtrum.com>, Baolin Wang <baolin.wang@linaro.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel.

On 11/11/2018 03:29 PM, Pavel Machek wrote:
> On Tue 2018-11-06 23:07:13, Jacek Anaszewski wrote:
>> Refer to new "function" and "color" properties and mark "label"
>> as deprecated.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
> 
> Don't you want to keep both color and label? New dts on old kernel
> should still work...?
> 
> Ok, I see these are only examples....

Right, this is only an example, and we'd rather want to encourage
people to switch to using new LED naming.

>> @@ -25,17 +27,17 @@ led-controller@200 {
>>  	reg = <0x200>;
>>  
>>  	led@0 {
>> -		label = "red";
>> +		color = "red";
>>  		reg = <0x0>;
>>  	};
>>  
>>  	led@1 {
>> -		label = "green";
>> +		color = "green";
>>  		reg = <0x1>;
>>  	};
>>  
>>  	led@2 {
>> -		label = "blue";
>> +		color = "blue";
>>  		reg = <0x2>;
>>  	};
>>  };
> 

-- 
Best regards,
Jacek Anaszewski

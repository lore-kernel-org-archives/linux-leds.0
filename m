From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Thu, 17 Jan 2019 07:27:00 -0600
Message-ID: <8def5414-9170-7034-34f9-70e6c71f8161@ti.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com> <20190116220401.GA28024@amd>
 <8c7dde3e-5f3c-80a5-ec57-73ce8e39deef@ti.com> <20190117100651.GB17930@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117100651.GB17930@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 1/17/19 4:06 AM, Pavel Machek wrote:
> Hi!
> 
>>>>> You know what? First, submit driver with similar functionality to
>>>>> existing RGB drivers, using same interface existing drivers are
>>>>> using. When that is accepted, we can talk about extending
>>>>> kernel<->user interfaces.
>>>>>
>>>>
>>>> I could do that but then there is no way for users to have any other color but "white" with this driver.
>>>> That defeats the purpose of the device itself.
>>>
>>> No, that is not what I meant.
>>>
>>> We do have RGB drivers in tree, they just present three separate LEDs
>>> -- red, green and blue. I ask you to do the same for initial
>>> submission.
>>>
>>
>> For clarification you are asking me to register a LED class per
>> output pin?
> 
> Yes.
> 

OK I can do that but I would like to get Jacek to align with this as he
suggested creating the code as I submitted based on the review of the
devices data sheet.

LED class registration per LED module or for the single Banked output.

>> As explained before the Master brightness register has absolute control over the output current
>> to the LED outputs regardless of the color control setting.
>>
> 
> Yes, just set master brightness to 255 and you can ignore it.

OK Sounds fine.  Will just need to do an init that sets the color
register to 0 and brightness to 0 so we don't have a flash.

> 
>>> You'll still be able to set brightness independently on the
>>> red/green/blue LEDs...
>>>
>>
>> But which one would control the overall brightness of the cluster?
> 
> You would not have that control in initial version of the patch.
> 

See above on alignment

Dan

> 								Pavel
> 


-- 
------------------
Dan Murphy

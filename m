From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Sat, 5 Jan 2019 14:16:17 +0100
Message-ID: <8044cdd9-b9b3-fddd-6106-184b906859e2@gmail.com>
References: <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
 <986b5105-2fdb-bd25-7c8a-ca8fd1ade821@gmail.com>
 <7f205102-e854-f1cb-cc03-1307d1cddc87@gmail.com>
 <c9f8965a-90f4-b456-8225-c70694c9f071@gmail.com>
 <cf6c0025-36e7-197b-b27a-1f31fb45cc38@gmail.com> <20190104201256.GA2931@amd>
 <a4e3a782-de76-ba91-3727-4db69cf27c3a@gmail.com> <20190104220726.GA12395@amd>
 <4cf79414-578e-eea7-4f46-fc8789206988@gmail.com> <20190105123146.GA16354@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190105123146.GA16354@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 1/5/19 1:31 PM, Pavel Machek wrote:
>>> We will need to solve RGB leds somehow, hopefully this is solved with
>>> it.
>>
>> When? With this attitude we will procrastinate it forever.
>> It's been almost 3 years since first HSV patches.
>>
>> I proposed rough design of LED RGB class interface in [0].
>> If you find it totally flawed, then please spot the problems.
>> If not, let's improve it and implement.
> 
> That is fatally flawed, and inferior to the HSV patches, sorry...

Please spot the problems.

> Grab yourself an RGB LED and play with it; you'll see what the
> problems are. It is hard to explain colors over email...

Video [0] gives some overview of lp5024 capabilities.

I don't see any problems in exposing separate red,green,blue
files and brightness for the devices with hardware support for
that.

I want to push things forward and I'm going to ask Dan
to give this design a try.

[0] https://www.youtube.com/watch?v=qdt-alh8i6E

-- 
Best regards,
Jacek Anaszewski

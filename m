From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Tue, 29 Jan 2019 15:46:53 -0600
Message-ID: <0dc95321-85cd-a1fe-cbf2-4b1f73c35b7e@ti.com>
References: <4a20b14c-9514-25b8-affe-20f9ede4d4d8@ti.com>
 <8fac6aeb-28a8-d136-c654-9d1b5d4f7ddb@gmail.com>
 <27318c48-f84a-5129-ac88-545edd549101@gmail.com>
 <21d3e21a-e50e-ee46-6f81-5a22db878c15@ti.com>
 <1c7680d3-6926-d837-dcd9-254aca23df39@gmail.com>
 <3e804986-89ef-2465-51ad-86e793b39b7e@ti.com>
 <f7ad8d5a-2998-f6f0-be4b-b47237b3397f@gmail.com>
 <4d80cc7f-1f18-ec5b-d312-a6a0da2a4506@ti.com>
 <ca8b4251-afd4-ddde-96f2-6e3fc72e3b55@gmail.com>
 <a097bfc8-cdee-67bb-6c30-6a31142d01ab@ti.com> <20190129214513.GA8692@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129214513.GA8692@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 1/29/19 3:45 PM, Pavel Machek wrote:
> Hi!
> 
> Could you, trim the parts of email you do not need in the reply? This
> is quite annoying to follow:
> 

Agreed.

> On Tue 2019-01-29 14:26:20, Dan Murphy wrote:
>> Jacek
>>
>> On 1/29/19 2:19 PM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> On 1/29/19 2:56 PM, Dan Murphy wrote:
>>>> Jacek
>>>>
>>>> On 1/24/19 3:55 PM, Jacek Anaszewski wrote:
>>>>> Dan
>>>>>
>>>>> On 1/24/19 10:00 PM, Dan Murphy wrote:
>>>>>> Jacek
>>>>>>
>>>>>> On 1/23/19 3:52 PM, Jacek Anaszewski wrote:
>>>>>>> Dan,
>>>>>>>
>>>>>>> On 1/22/19 11:44 PM, Dan Murphy wrote:
>>>>>>>> Jacek
>>>>>>>>
>>>>>>>> On 1/22/19 3:39 PM, Jacek Anaszewski wrote:
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> On 1/20/19 7:42 AM, Vesa Jääskeläinen wrote:
>>>>>>>>>> Hi Dan,
>>>>>>>>>>
>>>>>>>>>> On 18/01/2019 15.58, Dan Murphy wrote:
>>>>>>>>>>> Jacek
>>>>>>>>>>>
>>>>>>>>>>> On 1/18/19 7:45 AM, Dan Murphy wrote:
>>>>>>>>>>>> Jacek
>>>>>>>>>>>>
>>>>>>>>>>>> On 1/17/19 3:10 PM, Jacek Anaszewski wrote:
>>>>>>>>>>>>> Hi Dan,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 1/16/19 7:41 PM, Dan Murphy wrote:
>>>>>>>>>>>>>> Hello
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 1/16/19 4:55 AM, Pavel Machek wrote:
>>>>>>>>>>>>>>> Hi!
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On 1/15/19 4:22 PM, Pavel Machek wrote:
>>>>>>>>>>>>>>>>> Hi!
>>>>>>>>>>>>>>>>>
> ...
> 
>>>> If this is OK I can post the patch with this update.
>>>>
>>>> But I would rather put the file creation in a class and have the colors directory.
>>>
>>> Yes, please post your work when it is ready.
>>
>> OK.  I will derive the class and try to post it by the EOW.
> 
> You can do that, but if you post the description of kernel<->user
> interface, first, you may save yourself a bit of coding...
> 

OK I will put together the interface doc first and push a RFC.
Then put some code together

Dan

> Thanks,
> 									Pavel
> 


-- 
------------------
Dan Murphy

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Sat, 8 Sep 2018 21:53:00 +0200
Message-ID: <226b8770-7041-39a4-5a06-6002a7c1225f@gmail.com>
References: <20180906135005.6718-1-dmurphy@ti.com>
 <20180906211617.GB16899@amd> <b8ac9d52-f16d-5fc4-0e9a-9246b9f984c5@ti.com>
 <20180907133228.GA16297@amd> <70f7506c-6a3d-3830-59a4-a246dc6163f7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70f7506c-6a3d-3830-59a4-a246dc6163f7@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

On 09/07/2018 03:52 PM, Dan Murphy wrote:
[...]
>>
>>> And I think Jacek pointed out that the bindings references in this bindings
>>> don't even exist.
>>>
>>> I am thinking we need to deprecate this MFD driver and consolidate these drivers
>>> in the LED directory as we indicated before.  I did not find any ti-lmu support
>>> code.
>>>
>>> ti-lmu common core code and then the LED children appending the feature differentiation.
>>
>>> Need some maintainer weigh in here.
>>
>> Hehe. I'm maintnainer. Fun.
> 
> I know.  I want to see if there was any other opinion.  Especially for the LED driver.
> 
[...]

I have a question - is this lm3697 LED controller a cell of some MFD
device? Or is it a self-contained chip?

-- 
Best regards,
Jacek Anaszewski

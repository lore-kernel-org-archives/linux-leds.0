From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for lm3697 driver
Date: Mon, 10 Sep 2018 09:37:15 -0500
Message-ID: <20a814ce-a4c5-0649-6677-6b85a5fd2321@ti.com>
References: <20180906135005.6718-1-dmurphy@ti.com>
 <20180906211617.GB16899@amd> <b8ac9d52-f16d-5fc4-0e9a-9246b9f984c5@ti.com>
 <20180907133228.GA16297@amd> <70f7506c-6a3d-3830-59a4-a246dc6163f7@ti.com>
 <226b8770-7041-39a4-5a06-6002a7c1225f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <226b8770-7041-39a4-5a06-6002a7c1225f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 09/08/2018 02:53 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 09/07/2018 03:52 PM, Dan Murphy wrote:
> [...]
>>>
>>>> And I think Jacek pointed out that the bindings references in this bindings
>>>> don't even exist.
>>>>
>>>> I am thinking we need to deprecate this MFD driver and consolidate these drivers
>>>> in the LED directory as we indicated before.  I did not find any ti-lmu support
>>>> code.
>>>>
>>>> ti-lmu common core code and then the LED children appending the feature differentiation.
>>>
>>>> Need some maintainer weigh in here.
>>>
>>> Hehe. I'm maintnainer. Fun.
>>
>> I know.  I want to see if there was any other opinion.  Especially for the LED driver.
>>
> [...]
> 
> I have a question - is this lm3697 LED controller a cell of some MFD
> device? Or is it a self-contained chip?
> 

This is a self contained chip.  And the LM3697 only function is a LED driver.
It does not have any other special functions like the LM363X drivers for GPIO and Regulator support.


Dan

-- 
------------------
Dan Murphy

From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [RFC PATCH] leds: multicolor: Add sysfs interface definition
Date: Fri, 8 Feb 2019 06:55:34 +0200
Message-ID: <6afa674b-9c4e-2568-c758-030e93aebd06@gmail.com>
References: <20190130183005.833-1-dmurphy@ti.com> <20190130223542.GA22040@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130223542.GA22040@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi All,

On 31/01/2019 0.35, Pavel Machek wrote:
> On Wed 2019-01-30 12:30:05, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
> 
> No, sorry. This does not most of the requirements.
> 
> 								Pavel
> 
> Requirements for RGB LED interface:

...

I have tried to capture relevant parts of ideas and requirements and 
usage in a wiki page in github:

https://github.com/vesajaaskelainen/linux-multicolor-leds/wiki

I believe the discussion is good to perform in mailing list -- I am 
happy to update or give you access to update the wiki so we could have 
easy to use summary/details source during discussions.

Ideas on the interface seem to be a bit drifting so I apologize if some 
of Your ideas were not captured.

There has been at least two direct proposals for userspace interface and 
I tried to provide usage example also for Dan's proposal. Feel free to 
correct me if I made a mistake.

I believe it is a good to create summary page as there seems to many 
aspects to be though out. What do you feel on this approach?

Thanks,
Vesa Jääskeläinen

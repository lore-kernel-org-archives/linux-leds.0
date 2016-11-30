From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 30 Nov 2016 10:36:51 +0100
Message-ID: <959f287f-74c1-d790-4f36-9c7ac053bc8e@axentia.se>
References: <CGME20161130030845epcas5p2369d1c7cabb765ef0039b8e8d5aaa965@epcas5p2.samsung.com>
 <1480475311-14385-1-git-send-email-tnhuynh@apm.com>
 <302ebc57-6f52-b0ff-e354-0c67556a88ed@samsung.com>
 <7efcf021-72c9-328a-ad88-4c226e8b5d6d@samsung.com>
 <CANQ9TuAc8S-Q2Wx_qkJLLMd8dH7XDiGchB7EesPW1is9oFqWhA@mail.gmail.com>
 <c1d0e813-9e1e-b387-735a-2c8f39c5308e@samsung.com>
 <dc989a8b92342d2ceb63381ae9dc019d@mail.gmail.com>
 <10443ff4-67ff-d474-401f-21fa7f33a9a5@samsung.com>
 <328afec669295cbc3a4338a4347e7067@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <328afec669295cbc3a4338a4347e7067@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phong Vo <pvo@apm.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, patches <patches@apm.com>, Tin Huynh <tnhuynh@apm.com>
List-Id: linux-leds@vger.kernel.org

On 2016-11-30 10:10, Phong Vo wrote:
> +-----Original Message-----
> +From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> +
> +Hi Phong,
> +
> +On 11/30/2016 09:23 AM, Phong Vo wrote:
> +> +-----Original Message-----
> +> +From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> +> +
> +> +On 11/30/2016 09:06 AM, Tin Huynh wrote:
> +> +> On Wed, Nov 30, 2016 at 3:01 PM, Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> +> +>> On 11/30/2016 08:51 AM, Jacek Anaszewski wrote:
> +> +>>> On 11/30/2016 04:08 AM, Tin Huynh wrote:
> +> +>>>> +static const struct acpi_device_id pca955x_acpi_ids[] = {
> +> +>>>> +    { .id = "PCA9550", .driver_data = pca9550 },
> +> +>>>> +    { .id = "PCA9551", .driver_data = pca9551 },
> +> +>>>> +    { .id = "PCA9552", .driver_data = pca9552 },
> +> +>>>> +    { .id = "PCA9553", .driver_data = pca9553 },
> +> +>>>> +    { }
> +> +>>
> +> +>>
> +> +>> OK, I see that you brought back explicit properties in the
> +> +>> structure initializer. Is there some vital reason for that?
> +>
> +> It's not vital, but to make it consistent with what was done for
> +> pca963x,
> +
> +For pca963x I applied the version without explicit properties.
> +Note that this is consistent with pca963x_id array above the added
> +pca963x_acpi_ids. For pca955x the situation is the same.
> +
> +> and also per suggestion by Mika on reviewing  a different driver
> +> mux:954x in another thread.
> +
> +Could you give a reference to that thread? In the review of V1 of this
> +patch Mika mentioned "{ "PCA9553", pca9553 }" scheme.
> +
> 
> Actually it was Peter Rosin (not Mika) on linux-i2c and the reference to
> that is follows
> 
> https://lkml.org/lkml/2016/11/18/732
> 
> I am including Robin here.

I tried to say that I *personally* would have added the explicit
field specifiers but that it didn't seem like the norm and that both
of the approaches would therefore be perfectly ok by me (as there are
other examples of acpi id table initializers with field specifiers).

To sum up, I don't really care. But my question lingers, is there some
compelling reason to not have the explicit field specifiers?

Cheers,
Peter

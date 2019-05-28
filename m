From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: cross-merges with MFD tree (was: Re: GFS2: Pull Request)
Date: Tue, 28 May 2019 20:55:30 +0200
Message-ID: <61f6987a-5502-f119-6595-fc6badb864fb@gmail.com>
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
 <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Linus,

On 5/8/19 7:55 PM, Linus Torvalds wrote:
> On Wed, May 8, 2019 at 4:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>>
>> There was a conflict with commit 2b070cfe582b ("block: remove the i
>> argument to bio_for_each_segment_all") on Jens's block layer changes
>> which you've already merged. I've resolved that by merging those block
>> layer changes; please let me know if you want this done differently.
> 
> PLEASE.
> 
> I say this to somebody pretty much every single merge window: don't do
> merges for me.
> 
> You are actually just hurting, not helping. I want to know what the
> conflicts are, not by being told after-the-fact, but by just seeing
> them and resolving them.
> 
> Yes, I like being _warned_ ahead of time - partly just as a heads up
> to me, but partly also to show that the maintainers are aware of the
> notifications from linux-next, and that linux-next is working as
> intended, and people aren't just ignoring what it reports.
> 
> But I do *NOT* want to see maintainers cross-merging each others trees.

I would like to clarify if this applies to immutable integration
branches that are usually created for MFD subsystem. That subsystem
is somehow specific since changes made to MFD drivers are often a part
of bigger patch sets that add drivers of MFD cells to the other
subsystems.

Like in my area of interest an addition of a driver for LED cell
of MFD device must be followed by addition of a corresponding entry to
struct mfd_cell array in the related MFD driver.

And sometimes even another subsystem is involved, like e.g. regulator
framework in case of recent extension of ti-lmu driver.

So far you haven't complained about this specific workflow, but I'd like
to make sure how you see it.

-- 
Best regards,
Jacek Anaszewski

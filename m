From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 21:29:45 +0200
Message-ID: <20160916192945.GB18466@amd>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <a3496eea-dc5d-b9c7-bfa4-19b8f004d5ee@lechnology.com>
 <20160916055014.GA13205@amd>
 <b7c3ce51-e232-5dea-b413-f01bea59cc84@samsung.com>
 <71c2cef3-c509-07e1-204b-82db154d7df3@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71c2cef3-c509-07e1-204b-82db154d7df3@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> >>>After some digging around the kernel, I don't see many instances of
> >>>validating device node names. The best I have found so far comes from
> >>>create_entry() in binfmt_misc.c
> >>>
> >>>    if (!e->name[0] ||
> >>>        !strcmp(e->name, ".") ||
> >>>        !strcmp(e->name, "..") ||
> >>>        strchr(e->name, '/'))
> >>>        goto einval;
> >>>
> >>>Would something like this be a sufficient sanity check? I suppose we
> >>>could
> >>>also check for non-printing characters, but I don't think ignoring them
> >>>would be a security issue.
> >>
> >>That would be minimum, yes. I guess it would be better/easier to just
> >>limit the names to [a-zA-Z:-_0-9]*?
> >
> >Right, and we also could check if there are no more then two ":"
> >characters in the name.
> >
> 
> Again, I am going to disagree here. docs/sysfs-rules.txt says nothing about
> restricting characters for device names, so I don't think we should do so
> here. In fact, the only thing it says about names is "applications need to
> handle spaces and characters like '!' in the name". My opinion is that if
> people want to give devices dumb names with special characters and spaces,
> we should let them.

You should be able to emulate your leds on the rapsperry pi. So
checking number of :'s does not make sense.

OTOH having a LED called ^[c that clears your screen, or having
invalid utf-8 in name .. is just going to cause problems for someone,
somewhere. Perhaps you can even use mouse reporting escape sequences
to prepare some nice surprise for admin doing "dmesg". Don't go
there.. please.

> If someone can point out a real security issue here, then I will gladly fix
> it, otherwise I am inclined to leave it as it is (with the checks for '.',
> '..' and '/').

Thanks for those checks.

But I'd really disallow control characters (<0x20), space and
non-ascii stuff (>0x7f). Yes, userspace _should_ handle that ok, but
device names usually don't contain crazy characters, I'm pretty sure
there is printk() with something like that (which would have sideeffects)..

> If this was a regular userspace library, I would feel differently, but since
> the kernel has limited means to pass errors to userspace, all of these
> checks will pass the same -EINVAL to userspace if they fail. We could print
> error messages to the kernel log, but it is really annoying to have to check
> the kernel log to find out why your userspace application is not working.
> Any if you are not a kernel hacker, you would probably not even know to
> check the kernel logs.

People doing device drivers normally know about printk()... (and I
don't expect people to hit the name limits too often.)

But people are normally careless, and do dangerous stuff such as
"dmesg" and "ls /sys/class/leds". If those can contain crazy
characters, bad things can happen.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

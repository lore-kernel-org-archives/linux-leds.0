From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v3] leds: trigger: Introduce a NETDEV trigger
Date: Fri, 8 Dec 2017 15:32:18 +0100
Message-ID: <CAOFm3uFgfRzNwpFE70QtkR0SuccqQ_k9-Av5vkhqKEaK476oLA@mail.gmail.com>
References: <1512647169-11796-1-git-send-email-ben.whitten@lairdtech.com>
 <CAOFm3uGxzg45ZGmE4GRwy=oiaNERtq7tYdG4VwgZc0xgvXG6Pg@mail.gmail.com> <20171208142707.GA7793@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171208142707.GA7793@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Ben Whitten <ben.whitten@gmail.com>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel,

On Fri, Dec 8, 2017 at 3:27 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Thu 2017-12-07 14:01:39, Philippe Ombredanne wrote:
>> Ben,
>>
>> On Thu, Dec 7, 2017 at 12:46 PM, Ben Whitten <ben.whitten@gmail.com> wrote:
>> > From: Ben Whitten <ben.whitten@gmail.com>
>> >
>> > This commit introduces a NETDEV trigger for named device
>> > activity. Available triggers are link, rx, and tx.
>> >
>> > Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
>> []
>> > --- /dev/null
>> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
>> > @@ -0,0 +1,503 @@
>> > +/*
>> > + * LED Kernel Netdev Trigger
>> > + *
>> > + * Toggles the LED to reflect the link and traffic state of a named net device
>> > + *
>> > + * Copyright 2017 Ben Whitten <ben.whitten@gmail.com>
>> > + *
>> > + * Copyright 2007 Oliver Jowett <oliver@opencloud.com>
>> > + *
>> > + * Derived from ledtrig-timer.c which is:
>> > + *  Copyright 2005-2006 Openedhand Ltd.
>> > + *  Author: Richard Purdie <rpurdie@openedhand.com>
>> > + *
>> > + * This program is free software; you can redistribute it and/or modify
>> > + * it under the terms of the GNU General Public License version 2 as
>> > + * published by the Free Software Foundation.
>> > + *
>> > + */
>>
>> Have you considered using the new SPDX id instead ? See Thomas doc
>> patches and Greg and Linus comments on the topic
>> Here this would likely come out this way (yes, using a C++ comment at the top):
>>
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * LED Kernel Netdev Trigger
>> > + *
>> > + * Toggles the LED to reflect the link and traffic state of a named net device
>> > + *
>> > + * Copyright 2017 Ben Whitten <ben.whitten@gmail.com>
>> > + *
>> > + * Copyright 2007 Oliver Jowett <oliver@opencloud.com>
>> > + *
>> > + * Derived from ledtrig-timer.c which is:
>> > + *  Copyright 2005-2006 Openedhand Ltd.
>> > + *  Author: Richard Purdie <rpurdie@openedhand.com>
>> > + *
>> > + */
>>
>>
>> This is cleaner and simpler, don't you think?
>
> Please consider putting SPDX where it logically belongs -- near the
> copyright.

Linus wants it on the first line. So you could write this way alright:

>> > +// SPDX-License-Identifier: GPL-2.0
>> > +// Copyright 2017 Ben Whitten <ben.whitten@gmail.com>
>> > +// Copyright 2007 Oliver Jowett <oliver@opencloud.com>
>> > +/*
>> > + * LED Kernel Netdev Trigger
>> > + *
>> > + * Toggles the LED to reflect the link and traffic state of a named net device
>> > + *
>> > + * Derived from ledtrig-timer.c which is:
>> > + *  Copyright 2005-2006 Openedhand Ltd.
>> > + *  Author: Richard Purdie <rpurdie@openedhand.com>
>> > + *
>> > + */

For  reference please check Linus [1][2][3], Thomas [4] and Greg [5]
comments on the topic of C++ style // comments and first line placement.

Jonathan also wrote a nice background article on the SPDXification
topic at LWN [6]

[1] https://lkml.org/lkml/2017/11/2/715
[2] https://lkml.org/lkml/2017/11/25/125
[3] https://lkml.org/lkml/2017/11/25/133
[4] https://lkml.org/lkml/2017/11/2/805
[5] https://lkml.org/lkml/2017/10/19/165
[6] https://lwn.net/Articles/739183/

-- 
Cordially
Philippe Ombredanne

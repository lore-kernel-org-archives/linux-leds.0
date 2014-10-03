From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] led: remove use of gpiochip_remove() retval
Date: Fri, 3 Oct 2014 10:15:21 -0700
Message-ID: <CAK5ve-+_6sVypk_UTQ5kD4dMx+yqFk_4yQZTY3gOAjCRQ5YO8w@mail.gmail.com>
References: <1412087707-8313-1-git-send-email-pramod.gurav@smartplayin.com>
 <CAK5ve-KCYHySjs4f+rd+kAvKQmTkJqsq87Muq_j-D0nB7WSYjQ@mail.gmail.com> <CACRpkdZDVPTKX4N9fxYdr1OEBQ_BisU2vXrvNRZ3YXCax4jm+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZDVPTKX4N9fxYdr1OEBQ_BisU2vXrvNRZ3YXCax4jm+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, lkml <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Oct 2, 2014 at 12:12 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Sep 30, 2014 at 11:21 PM, Bryan Wu <cooloney@gmail.com> wrote:
>> On Tue, Sep 30, 2014 at 7:35 AM, Pramod Gurav
>> <pramod.gurav@smartplayin.com> wrote:
>>> Get rid of using return value from gpiochip_remove() as it returns
>>> void.
>>
>> Looks good to me. I will merge it.
>
> Please don't.
>
> The issue is already fixed through the GPIO tree, where the
> API change is.
>

Oh, really. I wasn't aware that. Let me drop this change then.

Thanks,
-Bryan

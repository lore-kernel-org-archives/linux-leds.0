From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [GIT PULL] LED updates for 4.9-rc6
Date: Sat, 19 Nov 2016 08:40:23 +0100
Message-ID: <64a26bd5-1091-34ec-31a0-75c62c471699@gmail.com>
References: <1479478415-5798-1-git-send-email-j.anaszewski@samsung.com>
 <CA+55aFwH1Bxne+CNBLucq-26E__juV7iUJhedc=UKEDTgaiopw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:36377 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752380AbcKSHlK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Nov 2016 02:41:10 -0500
In-Reply-To: <CA+55aFwH1Bxne+CNBLucq-26E__juV7iUJhedc=UKEDTgaiopw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>

On 11/18/2016 06:07 PM, Linus Torvalds wrote:
> On Fri, Nov 18, 2016 at 6:13 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>>
>> Please pull LED subsystem related updates for MAINTAINERS.
>> I'd like to announce a new co-maintainer - Pavel Machek.
>
> No can do.
>
> You've done something incredibly odd, including rebasing my 4.9-rc4
> commit (and four commits before that from other people).

Sorry, I didn't pay enough attention while generating this pull request.

I have the commit to merge also on top of for-next branch.
I copied that branch locally, executed git rebase -i HEAD~20, removed
all preceding commits up to v4.9-rc4 and pushed out. I forgot that git
touches all commits within the range passed to git rebase -i. Certainly
I should have used git rebase --onto, as in my usual workflow.

I've just generated new pull request in the right way.

-- 
Best regards,
Jacek Anaszewski

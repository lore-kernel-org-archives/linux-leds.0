From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] LED fixes for 4.20-rc2
Date: Thu, 8 Nov 2018 17:51:39 -0600
Message-ID: <CAHk-=wg9cYHtZZ6_n0O0MdpOhTKUhQo5iqeM_xnRLrDkb8F3xA@mail.gmail.com>
References: <1541705348-4615-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541705348-4615-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, baolin.wang@linaro.org, geert+renesas@glider.be, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

On Thu, Nov 8, 2018 at 1:29 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
>
> All three fixes are related to the newly added pattern trigger:
>
> - remove mutex_lock() from timer callback, which would trigger problems
>   related to sleeping in atomic context, the removal is harmless since
>   mutex protection turned out to be redundant in this case
> - fix pattern parsing to properly handle intervals with brightness == 0
> - fix typos in the ABI documentation

Pulled,

                Linus

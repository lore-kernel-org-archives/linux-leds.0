From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Change LED subsystem git tree URL
Date: Wed, 19 Aug 2015 09:45:31 -0700
Message-ID: <CAK5ve-J6n2RMODsOVi=m-NW46wAwvAMmq8ckL1z6MkMqANVtwQ@mail.gmail.com>
References: <1439981261-9786-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:34651 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797AbbHSQpv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 12:45:51 -0400
In-Reply-To: <1439981261-9786-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Wed, Aug 19, 2015 at 3:47 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> This patch removes Bryan Wu from the list of LED subsystem
> maintainers and replaces related git tree URL with the one
> maintained by Jacek Anaszewski.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>

Acked-by: Bryan Wu <cooloney@gmail.com>


> ---
>  MAINTAINERS |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 569568f..f8ebbef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6040,11 +6040,10 @@ F:      Documentation/scsi/53c700.txt
>  F:     drivers/scsi/53c700*
>
>  LED SUBSYSTEM
> -M:     Bryan Wu <cooloney@gmail.com>
>  M:     Richard Purdie <rpurdie@rpsys.net>
>  M:     Jacek Anaszewski <j.anaszewski@samsung.com>
>  L:     linux-leds@vger.kernel.org
> -T:     git git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>  S:     Maintained
>  F:     drivers/leds/
>  F:     include/linux/leds.h
> --
> 1.7.9.5
>

From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] ledtrig-cpu.c: fix english
Date: Mon, 03 Oct 2016 12:16:38 +0200
Message-ID: <dca2ddaf-7dca-0d7f-ce80-8b19b84f3ace@samsung.com>
References: <CGME20161003081324eucas1p1a7ab48c17135313641606d0079a3a7b5@eucas1p1.samsung.com>
 <20161003081313.GA15499@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27666 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752056AbcJCKQp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 06:16:45 -0400
In-reply-to: <20161003081313.GA15499@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

Hi Pavel,

On 10/03/2016 10:13 AM, Pavel Machek wrote:
>
> Fix english spelling.
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> index 22f0634..9719caf 100644
> --- a/drivers/leds/trigger/ledtrig-cpu.c
> +++ b/drivers/leds/trigger/ledtrig-cpu.c
> @@ -42,7 +42,7 @@ static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
>   * @evt: CPU event to be emitted
>   *
>   * Emit a CPU event on a CPU core, which will trigger a
> - * binded LED to turn on or turn off.
> + * bound LED to turn on or turn off.
>   */
>  void ledtrig_cpu(enum cpu_led_event ledevt)
>  {
>

Thanks for the patch.
Applied to the for-4.10 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski

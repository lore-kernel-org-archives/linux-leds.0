From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH] leds: lp5523: add master_fader support
Date: Tue, 12 May 2015 07:52:59 +0900
Message-ID: <555132CB.6040806@ti.com>
References: <1431371454-2035-1-git-send-email-toshik@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:53395 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870AbbEKWxH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 May 2015 18:53:07 -0400
In-Reply-To: <1431371454-2035-1-git-send-email-toshik@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Toshi Kikuchi <toshik@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, j.anaszewski@samsung.com

Hi Bryan,

On 5/12/2015 4:10 AM, Toshi Kikuchi wrote:
> This patch introduces 4 new attributes:
>    master_fader_leds
>    master_fader1
>    master_fader2
>    master_fader3
>
> Fo example, to map channel 0,6 to master_fader1,
> map channel 1,7 to master_fader2,
> map channel 2,8 to master_fader3, and
> map channel 3,4,5 to none
>
>    echo "123000123" > master_fader_leds
>
> A different factor can be set to each master_fader:
>
>    echo 255 > master_fader1
>    echo 100 > master_fader2
>    echo 0 > master_fader3
>
> Signed-off-by: Toshi Kikuchi <toshik@chromium.org>
> Acked-by: Milo Kim <milo.kim@ti.com>

Tested-by: Milo Kim <milo.kim@ti.com>

Best regards,
Milo

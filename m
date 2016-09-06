From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH] leds: Introduce userspace leds driver
Date: Tue, 6 Sep 2016 10:21:13 -0500
Message-ID: <7839f0a8-2d08-2579-4652-f25572ac1ad4@lechnology.com>
References: <1473128158-26915-1-git-send-email-david@lechnology.com>
 <alpine.DEB.2.02.1609060708210.29281@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:45260 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932180AbcIFPVQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 6 Sep 2016 11:21:16 -0400
In-Reply-To: <alpine.DEB.2.02.1609060708210.29281@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 09/06/2016 12:09 AM, Peter Meerwald-Stadler wrote:
> Hi,
>
>> This driver creates a userspace leds driver similar to uinput.
>
> is the module really called leds-user as claimed by Kconfig?
> or rather uleds
>

It is supposed to be "uleds". Thanks for catching that.

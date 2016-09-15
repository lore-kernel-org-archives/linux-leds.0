From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch] leds: add driver for Mellanox systems leds
Date: Thu, 15 Sep 2016 16:53:58 +0200
Message-ID: <4d4c0a66-f4e3-c37b-817d-495ff1b2f0d3@samsung.com>
References: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
 <CGME20160915125230eucas1p22ed4b6b430fa4acc3f29e36c302430ce@eucas1p2.samsung.com>
 <20160915125222.GG13132@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19133 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751032AbcIOOyK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 10:54:10 -0400
In-reply-to: <20160915125222.GG13132@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, vadimp@mellanox.com
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com

Hi Pavel,

On 09/15/2016 02:52 PM, Pavel Machek wrote:
> Hi!
>
>> +++ b/MAINTAINERS
>> @@ -7655,6 +7655,14 @@ W:	http://www.mellanox.com
>>  Q:	http://patchwork.ozlabs.org/project/netdev/list/
>>  F:	drivers/net/ethernet/mellanox/mlxsw/
>>
>> +MELLANOX MLXCPLD LED DRIVER
>> +M:	Vadim Pasternak <vadimp@mellanox.com>
>> +L:	linux-leds@vger.kernel.org
>> +S:	Supported
>> +W:	http://www.mellanox.com
>
> Unless you have web page specificly about the LED hardware, I don't
> think W: tag is useful here.
>

I raised also similar objections during review. Eventually I left
the entry after skimming through the MAINTAINERS and noticing few
other similar examples.

In fact, the link to the main page doesn't convey any better information
than can be obtained after searching google. I'm dropping the entry
then.

-- 
Best regards,
Jacek Anaszewski

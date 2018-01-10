From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] leds: ledtrig-transient: Add SPDX license identifiers
Date: Wed, 10 Jan 2018 15:43:00 -0700
Message-ID: <9a26debc-e04d-e935-d2d8-bba1df6d92e5@osg.samsung.com>
References: <20180110163540.8396-1-shuahkh@osg.samsung.com>
 <d1c6aab4-735d-565d-1bc4-9fd77e82e589@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:60657 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752345AbeAJWnJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 10 Jan 2018 17:43:09 -0500
In-Reply-To: <d1c6aab4-735d-565d-1bc4-9fd77e82e589@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz, keescook@chromium.org, shuah@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

On 01/10/2018 01:40 PM, Jacek Anaszewski wrote:
> Hi Shuah,
> 
> Thanks for the patch.
> 
> On 01/10/2018 05:35 PM, Shuah Khan wrote:
>> Replace GPL license statements with SPDX GPL-2.0 license identifiers
>> and and correct the module license to GPLv2.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  drivers/leds/trigger/ledtrig-transient.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
>> index 7acce64b692a..f0578af858e7 100644
>> --- a/drivers/leds/trigger/ledtrig-transient.c
>> +++ b/drivers/leds/trigger/ledtrig-transient.c
>> @@ -1,3 +1,4 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>>  /*
> 
> How about changing this whole block comment to "//"?
> We did it already for drivers/leds/trigger/ledtrig-netdev.c,
> present in linux-next. See related discussion with reference
> to relevant Linus' guidelines in this matter [0].
> 

v2 is on its way.

thanks,
-- Shuah

From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: document new usb-ports property
Date: Wed, 4 Jan 2017 07:33:32 +0100
Message-ID: <1ca1256a-7a97-1bd9-fe91-2d9076fb9331@gmail.com>
References: <20161229130306.30400-1-zajec5@gmail.com>
 <20170103205202.5ztb5i56d7qmgx5t@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35321 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935605AbdADGdg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Jan 2017 01:33:36 -0500
In-Reply-To: <20170103205202.5ztb5i56d7qmgx5t@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 01/03/2017 09:52 PM, Rob Herring wrote:
> On Thu, Dec 29, 2016 at 02:03:04PM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Some LEDs can be related to particular USB ports (common case for home
>> routers). This property allows describing such a relation.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> This patch is based on top of commit 52e847dc431 ("DT: leds: Improve examples
>> by adding some context") sitting in the linux-leds.git (for-4.11).
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index 24b6560..fcfe661 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -49,6 +49,14 @@ Optional properties for child nodes:
>>  - panic-indicator : This property specifies that the LED should be used,
>>  		    if at all possible, as a panic indicator.
>>
>> +- usb-ports : List of USB ports related to this LED. Some devices have LEDs that
>> +	      should be used to indicate USB device activity. This can be
>> +	      described with this property.
>> +	      There can be more than one LED like this, e.g. some vendors use
>> +	      one controller per USB version. It's then common to use different
>> +	      color LEDs depending on device USB standard (like USB 2.0 vs.
>> +	      USB 3.0).
>
> I don't like this being USB specific. Either we should have a generic
> way to link triggers to other DT nodes or the existing trigger property
> should be used (and be capable of listing more than 1 port). I'd prefer
> the latter as I don't think we need another way to specify triggers.

Hi Rob & thanks for your review.

Could you point me to "the existing trigger property" you meant, please? It's
not clear to me, sorry.

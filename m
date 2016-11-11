From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 3/4] platform: x86: dell-*: Add a generic dell-laptop
 notifier chain
Date: Fri, 11 Nov 2016 15:36:24 +0100
Message-ID: <467725b3-80ee-f36e-d61b-fd71216a6744@redhat.com>
References: <20161101133748.7168-1-hdegoede@redhat.com>
 <20161101133748.7168-3-hdegoede@redhat.com> <201611111517.08141@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:9638 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752395AbcKKOg2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 11 Nov 2016 09:36:28 -0500
In-Reply-To: <201611111517.08141@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 11-11-16 15:17, Pali Rohár wrote:
> On Tuesday 01 November 2016 14:37:47 Hans de Goede wrote:
>> @@ -43,4 +45,13 @@ void dell_smbios_release_buffer(void);
>>  void dell_smbios_send_request(int class, int select);
>>
>>  struct calling_interface_token *dell_smbios_find_token(int tokenid);
>> +
>> +enum dell_laptop_notifier_actions {
>> +	dell_laptop_kbd_backlight_brightness_changed,
>> +};
>
> Should not be upper case? Looks like that Documentation/CodingStyle also
> suggest it:
>
> Names of macros defining constants and labels in enums are capitalized.

Ok, I will send a v5 once we agree on how to do the thinkpad bits.

Regards,

Hans

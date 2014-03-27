From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] dell-led: add mic mute led interface
Date: Thu, 27 Mar 2014 10:46:37 -0700
Message-ID: <CAK5ve-KMQ33qkj8r2HJ8QWGLR5QCyQc3mc53go2f1Rn+ga+xvg@mail.gmail.com>
References: <1395826022-11372-1-git-send-email-alex.hung@canonical.com>
 <CAK5ve-L1rCR2DOW7yZJ9qDd9vdN6BCGKtCXZkOvfe14sEab5QQ@mail.gmail.com> <BLU172-W206A70FCC089C89E5E2AABAC670@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:46754 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757032AbaC0Rq7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Mar 2014 13:46:59 -0400
Received: by mail-lb0-f180.google.com with SMTP id 10so2815362lbg.25
        for <linux-leds@vger.kernel.org>; Thu, 27 Mar 2014 10:46:58 -0700 (PDT)
In-Reply-To: <BLU172-W206A70FCC089C89E5E2AABAC670@phx.gbl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Mar 27, 2014 at 6:34 AM, Joe Xue <lgxue@hotmail.com> wrote:
> Hi Bryan,
>
> What about the ledtrigger-pattern?
> Do we need to change some or just give it up.
>

After the discussion, I intend to have a good LED API instead of
adding this complex trigger driver. I like ledtrigger but it's not so
good and flexible for complex tasks like this.

We can start to think about a unified LED API for this use case, since
I got ping from other subsystem like V4L2 media who needs a good LED
API for atomic operation from user space.

Thanks for you effort and please help to move to right direction.
-Bryan

>
>
> ----------------------------------------
>> From: cooloney@gmail.com
>> Date: Wed, 26 Mar 2014 16:59:49 -0700
>> Subject: Re: [PATCH v2] dell-led: add mic mute led interface
>> To: alex.hung@canonical.com
>> CC: rpurdie@rpsys.net; linux-leds@vger.kernel.org
>>
>> On Wed, Mar 26, 2014 at 2:27 AM, Alex Hung <alex.hung@canonical.com> wrote:
>>> This patch provides similar led functional of
>>>
>>> 420f973 thinkpad-acpi: Add mute and mic-mute LED functionality
>>>
>>
>> Thanks for the update. I merged it into my -devel branch which targets
>> for 3.15, since right now it's 3.14-rc8 time frame.
>>
>> -Bryan
>>
>>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>>> ---
>>> drivers/leds/dell-led.c | 171 +++++++++++++++++++++++++++++++++++++++++++++--
>>> include/linux/dell-led.h | 10 +++
>>> 2 files changed, 174 insertions(+), 7 deletions(-)
>>> create mode 100644 include/linux/dell-led.h
>>>
>>> diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
>>> index e5c5738..c36acaf 100644
>>> --- a/drivers/leds/dell-led.c
>>> +++ b/drivers/leds/dell-led.c
>>> @@ -15,12 +15,15 @@
>>> #include <linux/leds.h>
>>> #include <linux/slab.h>
>>> #include <linux/module.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/dell-led.h>
>>>
>>> MODULE_AUTHOR("Louis Davis/Jim Dailey");
>>> MODULE_DESCRIPTION("Dell LED Control Driver");
>>> MODULE_LICENSE("GPL");
>>>
>>> #define DELL_LED_BIOS_GUID "F6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396"
>>> +#define DELL_APP_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
>>> MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
>>>
>>> /* Error Result Codes: */
>>> @@ -39,6 +42,149 @@ MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
>>> #define CMD_LED_OFF 17
>>> #define CMD_LED_BLINK 18
>>>
>>> +struct app_wmi_args {
>>> + u16 class;
>>> + u16 selector;
>>> + u32 arg1;
>>> + u32 arg2;
>>> + u32 arg3;
>>> + u32 arg4;
>>> + u32 res1;
>>> + u32 res2;
>>> + u32 res3;
>>> + u32 res4;
>>> + char dummy[92];
>>> +};
>>> +
>>> +#define GLOBAL_MIC_MUTE_ENABLE 0x364
>>> +#define GLOBAL_MIC_MUTE_DISABLE 0x365
>>> +
>>> +struct dell_bios_data_token {
>>> + u16 tokenid;
>>> + u16 location;
>>> + u16 value;
>>> +};
>>> +
>>> +struct __attribute__ ((__packed__)) dell_bios_calling_interface {
>>> + struct dmi_header header;
>>> + u16 cmd_io_addr;
>>> + u8 cmd_io_code;
>>> + u32 supported_cmds;
>>> + struct dell_bios_data_token damap[];
>>> +};
>>> +
>>> +static struct dell_bios_data_token dell_mic_tokens[2];
>>> +
>>> +static int dell_wmi_perform_query(struct app_wmi_args *args)
>>> +{
>>> + struct app_wmi_args *bios_return;
>>> + union acpi_object *obj;
>>> + struct acpi_buffer input;
>>> + struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>> + acpi_status status;
>>> + u32 rc = -EINVAL;
>>> +
>>> + input.length = 128;
>>> + input.pointer = args;
>>> +
>>> + status = wmi_evaluate_method(DELL_APP_GUID, 0, 1, &input, &output);
>>> + if (!ACPI_SUCCESS(status))
>>> + goto err_out0;
>>> +
>>> + obj = output.pointer;
>>> + if (!obj)
>>> + goto err_out0;
>>> +
>>> + if (obj->type != ACPI_TYPE_BUFFER)
>>> + goto err_out1;
>>> +
>>> + bios_return = (struct app_wmi_args *)obj->buffer.pointer;
>>> + rc = bios_return->res1;
>>> + if (rc)
>>> + goto err_out1;
>>> +
>>> + memcpy(args, bios_return, sizeof(struct app_wmi_args));
>>> + rc = 0;
>>> +
>>> + err_out1:
>>> + kfree(obj);
>>> + err_out0:
>>> + return rc;
>>> +}
>>> +
>>> +static void __init find_micmute_tokens(const struct dmi_header *dm, void *dummy)
>>> +{
>>> + struct dell_bios_calling_interface *calling_interface;
>>> + struct dell_bios_data_token *token;
>>> + int token_size = sizeof(struct dell_bios_data_token);
>>> + int i = 0;
>>> +
>>> + if (dm->type == 0xda && dm->length> 17) {
>>> + calling_interface = container_of(dm,
>>> + struct dell_bios_calling_interface, header);
>>> +
>>> + token = &calling_interface->damap[i];
>>> + while (token->tokenid != 0xffff) {
>>> + if (token->tokenid == GLOBAL_MIC_MUTE_DISABLE)
>>> + memcpy(&dell_mic_tokens[0], token, token_size);
>>> + else if (token->tokenid == GLOBAL_MIC_MUTE_ENABLE)
>>> + memcpy(&dell_mic_tokens[1], token, token_size);
>>> +
>>> + i++;
>>> + token = &calling_interface->damap[i];
>>> + }
>>> + }
>>> +}
>>> +
>>> +static int dell_micmute_led_set(int state)
>>> +{
>>> + struct app_wmi_args args;
>>> + struct dell_bios_data_token *token;
>>> +
>>> + if (!wmi_has_guid(DELL_APP_GUID))
>>> + return -ENODEV;
>>> +
>>> + if (state == 0 || state == 1)
>>> + token = &dell_mic_tokens[state];
>>> + else
>>> + return -EINVAL;
>>> +
>>> + memset(&args, 0, sizeof(struct app_wmi_args));
>>> +
>>> + args.class = 1;
>>> + args.arg1 = token->location;
>>> + args.arg2 = token->value;
>>> +
>>> + dell_wmi_perform_query(&args);
>>> +
>>> + return state;
>>> +}
>>> +
>>> +int dell_app_wmi_led_set(int whichled, int on)
>>> +{
>>> + int state = 0;
>>> +
>>> + switch (whichled) {
>>> + case DELL_LED_MICMUTE:
>>> + state = dell_micmute_led_set(on);
>>> + break;
>>> + default:
>>> + pr_warn("led type %x is not supported\n", whichled);
>>> + break;
>>> + }
>>> +
>>> + return state;
>>> +}
>>> +EXPORT_SYMBOL_GPL(dell_app_wmi_led_set);
>>> +
>>> +static int __init dell_micmute_led_init(void)
>>> +{
>>> + memset(dell_mic_tokens, 0, sizeof(struct dell_bios_data_token) * 2);
>>> + dmi_walk(find_micmute_tokens, NULL);
>>> +
>>> + return 0;
>>> +}
>>> +
>>> struct bios_args {
>>> unsigned char length;
>>> unsigned char result_code;
>>> @@ -181,21 +327,32 @@ static int __init dell_led_init(void)
>>> {
>>> int error = 0;
>>>
>>> - if (!wmi_has_guid(DELL_LED_BIOS_GUID))
>>> + if (!wmi_has_guid(DELL_LED_BIOS_GUID) && !wmi_has_guid(DELL_APP_GUID))
>>> return -ENODEV;
>>>
>>> - error = led_off();
>>> - if (error != 0)
>>> - return -ENODEV;
>>> + if (wmi_has_guid(DELL_APP_GUID))
>>> + error = dell_micmute_led_init();
>>>
>>> - return led_classdev_register(NULL, &dell_led);
>>> + if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
>>> + error = led_off();
>>> + if (error != 0)
>>> + return -ENODEV;
>>> +
>>> + error = led_classdev_register(NULL, &dell_led);
>>> + }
>>> +
>>> + return error;
>>> }
>>>
>>> static void __exit dell_led_exit(void)
>>> {
>>> - led_classdev_unregister(&dell_led);
>>> + int error = 0;
>>>
>>> - led_off();
>>> + if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
>>> + error = led_off();
>>> + if (error == 0)
>>> + led_classdev_unregister(&dell_led);
>>> + }
>>> }
>>>
>>> module_init(dell_led_init);
>>> diff --git a/include/linux/dell-led.h b/include/linux/dell-led.h
>>> new file mode 100644
>>> index 0000000..7009b8b
>>> --- /dev/null
>>> +++ b/include/linux/dell-led.h
>>> @@ -0,0 +1,10 @@
>>> +#ifndef __DELL_LED_H__
>>> +#define __DELL_LED_H__
>>> +
>>> +enum {
>>> + DELL_LED_MICMUTE,
>>> +};
>>> +
>>> +int dell_app_wmi_led_set(int whichled, int on);
>>> +
>>> +#endif
>>> --
>>> 1.8.1.2
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html

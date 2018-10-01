From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v13 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 1 Oct 2018 20:26:05 +0200
Message-ID: <61c0de18-e047-4759-f54d-da163a034d79@gmail.com>
References: <c91996be3f80f73c02944565461c3869619fdb1f.1538024257.git.baolin.wang@linaro.org>
 <d3401d05-81c3-0162-4dd0-b9c7c2652baf@gmail.com>
 <CAMz4ku+6xF2wiTfEj_u4wdPLM7aFnqTAtGnVyA+BpkdgBuzHgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4ku+6xF2wiTfEj_u4wdPLM7aFnqTAtGnVyA+BpkdgBuzHgQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Baolin,

On 10/01/2018 03:18 PM, Baolin Wang wrote:
> Hi Jacek,
> 
> On 30 September 2018 at 23:33, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> Hi Baolin,
>>
>> Thank you for adding the dimming support.
>>
>> I've tested it and detected severe problem when
>> delta_t is lower than 50, i.e. UPDATE_INTERVAL.
>>
>> echo "10 49 20 49" > pattern
>>
>> results after a while in a system wide freeze, see the following
>> kernel log:
>>
>> [  210.593592] rcu: INFO: rcu_sched self-detected stall on CPU
>> [  210.593601] rcu:     4-....: (21134 ticks this GP) idle=5b6/0/0x3
>> softirq=4843/4843 fqs=5250
>> [  210.593602] rcu:      (t=21000 jiffies g=25697 q=79)
>> [  210.593605] NMI backtrace for cpu 4
>> [  210.593608] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 4.19.0-rc1+ #156
>> [  210.593609] Hardware name: Gigabyte Technology Co., Ltd.
>> Z97-HD3/Z97-HD3, BIOS F6 06/11/2014
>> [  210.593609] Call Trace:
>> [  210.593612]  <IRQ>
>> [  210.593618]  dump_stack+0x46/0x5b
>> [  210.593621]  nmi_cpu_backtrace+0x90/0xa0
>> [  210.593625]  ? lapic_can_unplug_cpu+0x90/0x90
>> [  210.593627]  nmi_trigger_cpumask_backtrace+0x8d/0xc0
>> [  210.593630]  rcu_dump_cpu_stacks+0x83/0xb3
>> [  210.593632]  rcu_check_callbacks+0x5aa/0x710
>> [  210.593636]  ? tick_sched_do_timer+0x50/0x50
>> [  210.593638]  update_process_times+0x23/0x50
>> [  210.593640]  tick_sched_handle+0x2f/0x40
>> [  210.593642]  tick_sched_timer+0x32/0x70
>> [  210.593644]  __hrtimer_run_queues+0xf7/0x270
>> [  210.593646]  hrtimer_interrupt+0x11d/0x270
>> [  210.593649]  smp_apic_timer_interrupt+0x5d/0x130
>> [  210.593651]  apic_timer_interrupt+0xf/0x20
>> [  210.593655] RIP: 0010:pattern_trig_timer_function+0x23/0x100
>> [  210.593657] Code: ff ff eb f6 0f 1f 00 41 54 4c 8d a7 b0 df ff ff 55
>> 53 48 89 fb 49 8d ac 24 18 20 00 00 48 89 ef e8 f2 d3 29 00 eb 16 8b 53
>> f4 <8b> 08 39 ca 77 05 83 f9 31 77 6d 4c 89 e7 e8 aa f9 ff ff 80 7b f8
>> [  210.593658] RSP: 0018:ffff8d1017903eb8 EFLAGS: 00000216 ORIG_RAX:
>> ffffffffffffff13
>> [  210.593659] RAX: ffff8d0fe7330010 RBX: ffff8d0fe7332050 RCX:
>> 0000000000000031
>> [  210.593660] RDX: 0000000000000000 RSI: 0000000000000014 RDI:
>> 000000000000000a
>> [  210.593661] RBP: ffff8d0fe7332018 R08: ffff8d1017903f08 R09:
>> ffff8d1017903f08
>> [  210.593662] R10: 0000002c1cd5e92f R11: 0000000000000000 R12:
>> ffff8d0fe7330000
>> [  210.593663] R13: ffffffffaa738a70 R14: 0000000000000000 R15:
>> 0000000000000001
>> [  210.593665]  ? apic_timer_interrupt+0xa/0x20
>> [  210.593666]  ? pattern_trig_activate+0xc0/0xc0
>> [  210.593669]  ? pattern_trig_timer_function+0x36/0x100
>> [  210.593671]  call_timer_fn+0x26/0x130
>> [  210.593672]  run_timer_softirq+0x1cc/0x400
>> [  210.593674]  ? enqueue_hrtimer+0x35/0x90
>> [  210.593676]  ? __hrtimer_run_queues+0x127/0x270
>> [  210.593679]  ? recalibrate_cpu_khz+0x10/0x10
>> [  210.593681]  __do_softirq+0x104/0x2a5
>> [  210.593685]  irq_exit+0x9d/0xa0
>> [  210.593687]  smp_apic_timer_interrupt+0x67/0x130
>> [  210.593688]  apic_timer_interrupt+0xf/0x20
>> [  210.593689]  </IRQ>
>> [  210.593693] RIP: 0010:cpuidle_enter_state+0xf8/0x2a0
>> [  210.593694] Code: c7 0f 1f 44 00 00 31 ff e8 65 69 95 ff 80 7c 24 03
>> 00 74 12 9c 58 f6 c4 02 0f 85 8c 01 00 00 31 ff e8 7c 41 9a ff fb 4d 29
>> e7 <48> ba cf f7 53 e3 a5 9b c4 20 4c 89 f8 4c 89 fd 48 f7 ea 48 c1 fd
>> [  210.593695] RSP: 0018:ffffb0fc00cf7e88 EFLAGS: 00000206 ORIG_RAX:
>> ffffffffffffff13
>> [  210.593696] RAX: ffff8d1017920dc0 RBX: ffff8d1014b49c00 RCX:
>> 000000000000001f
>> [  210.593697] RDX: 0000000000000000 RSI: 000000c1514cc3a0 RDI:
>> 0000000000000000
>> [  210.593698] RBP: 0000000000000001 R08: fffffffbcf10adc2 R09:
>> 000000000000afc7
>> [  210.593699] R10: 000000000000003c R11: ffff8d101791fe68 R12:
>> 0000002c1d11a32d
>> [  210.593700] R13: 0000000000000001 R14: 0000000000000004 R15:
>> 0000000000011a82
>> [  210.593703]  ? cpuidle_enter_state+0xdb/0x2a0
>> [  210.593705]  do_idle+0x1f5/0x250
>> [  210.593707]  cpu_startup_entry+0x6a/0x70
>> [  210.593709]  start_secondary+0x183/0x1b0
>> [  210.593711]  secondary_startup_64+0xa4/0xb0
>>
>> Probably the best solution would be to avoid the dimming if
>> delta_t is lower than UPDATE_INTERVAL.
> 
> Thanks for your testing. Yes, I will valid the delta_t value when user
> use the gradual dimming, and add some comments in ABI to make it
> clear, that we should not set delta_t lower than UPDATE_INTERVAL for
> gradual dimming.

Thanks.

[...]
>>> +static ssize_t repeat_show(struct device *dev, struct device_attribute *attr,
>>> +                        char *buf)
>>> +{
>>> +     struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>> +     struct pattern_trig_data *data = led_cdev->trigger_data;
>>> +     int repeat;
>>> +
>>> +     mutex_lock(&data->lock);
>>> +
>>> +     repeat = data->last_repeat;
>>
>> I'm not sure if we discussed it earlier, but currently repeat_show
>> always reports initially requested repeat number, instead of the
>> number of remaining iterations. IMHO the latter approach would be
>> more useful.
> 
> That's what we discussed before and had a consensus about this. Please see:
> https://lore.kernel.org/patchwork/patch/971746/

Ah right. I had a vague reminiscence of this discussion, but failed to
track it back.

OK, so no action is required here, let's keep the things as we agreed.

-- 
Best regards,
Jacek Anaszewski

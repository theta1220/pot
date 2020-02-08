using System;
using System.Collections.Generic;
using System.Linq;
using Sumi.Util;

namespace Sumi
{
    public class Class : Block
    {
        public Class[] ChildClasses { get { return GetChildren(StaticClasses); } }

        private string[] _extendNames = new string[] { };
        private bool _extended = false;
        public bool IsInstance { get; private set; }

        private static Dictionary<string, Class> StaticClasses = new Dictionary<string, Class>();
        private static List<Class> StaticExtensions = new List<Class>();

        public static void Clear()
        {
            StaticClasses.Clear();
            StaticExtensions.Clear();
        }

        public static void AddStaticClass(string fullName, Class classDef)
        {
            AddStatic(StaticClasses, fullName, classDef);
        }

        public static void AddStaticExtension(Class ex)
        {
            StaticExtensions.Add(ex);
        }

        private static void AddStatic(Dictionary<string, Class> source, string fullName, Class classDef)
        {
            source.Add(fullName, classDef);
        }

        public static bool ExistsStaticClass(string fullName)
        {
            return ExistsStatic(StaticClasses, fullName);
        }

        public static bool ExistsStaticExtension(string name)
        {
            return GetStaticExtension(name) != null;
        }

        private static bool ExistsStatic(Dictionary<string, Class> source, string fullName)
        {
            return source.ContainsKey(fullName);
        }

        public static Class GetStaticClass(string fullName)
        {
            return GetStatic(StaticClasses, fullName);
        }

        public static Class GetStaticExtension(string name)
        {
            return StaticExtensions.Find(ex => ex.FullName == name);
        }

        private static Class GetStatic(Dictionary<string, Class> source, string fullName)
        {
            if (!ExistsStatic(source, fullName)) return null;
            return source[fullName];
        }

        public static string ReadName(string source)
        {
            var name = source.PoCut('{').PoSplitOnce(' ')[1];
            if (name.Contains(":"))
            {
                name = name.PoRemove(' ').PoCut(':');
            }
            return name;
        }

        public Class(Runnable parent, string source) : base(parent, source.PoExtract('{', '}'), ReadName(source))
        {
            var name = source.PoCut('{').PoSplitOnce(' ')[1];
            if (name.Contains(":"))
            {
                _extendNames = name.PoRemove(' ').PoSplit(':')[1].PoSplit(',');
                name = name.PoRemove(' ').PoCut(':');
            }
        }

        public Class(Class other) : base(other)
        {
            _extendNames = other._extendNames.ToArray();
            IsInstance = true;
        }

        public override Runnable Clone() { return new Class(this); }

        public Class[] GetChildren(Dictionary<string, Class> source)
        {
            var list = new List<Class>();
            foreach (var row in source)
            {
                var classDef = row.Value;
                if (!classDef.FullName.Contains(FullName)) continue;
                var name = classDef.FullName.PoSplitOnceTail('.');
                if (FullName == name[0])
                {
                    list.Add(classDef);
                }
            }
            return list.ToArray();
        }

        public Class FindClass(string name)
        {
            if (name.Contains("."))
            {
                var split = name.PoSplitOnce('.');
                var self = FindClass(split[0]);
                if (self == null) return null;
                return self.FindClass(split[1]);
            }
            else
            {
                var target = ChildClasses.FirstOrDefault(o => o.Name == name);
                var parent = GetParentClass();
                if (target == null && parent != null)
                {
                    return parent.FindClass(name);
                }
                return target;
            }
        }

        public static Class FindExtension(string name)
        {
            return StaticExtensions.FirstOrDefault(o => o.Name == name);
        }

        public static void ExtensionTest()
        {
            foreach (var ex in StaticExtensions)
            {
                ex.ExecuteTest();
            }
        }

        public void ClassTest()
        {
            foreach (var classDef in ChildClasses)
            {
                classDef.ExecuteTest();
                classDef.ClassTest();
            }
        }

        public void Extend()
        {
            if (_extended) return;

            foreach (var name in _extendNames)
            {
                var def = FindClass(name);
                if (!def._extended)
                {
                    def.Extend();
                }
                Using(def);
            }
            foreach (var classDef in ChildClasses)
            {
                classDef.Extend();
            }
            _extended = true;
        }

        public override void OnLeaved()
        {
            // なにもしない
        }

        public override void OnReset()
        {
            // なにもしない
        }

        public static bool HasValue(Value[] args)
        {
            Log.Assert(args.Length >= 2, "引数が足りません");
            var target = args[0].Object as Class;
            Log.Assert(target != null, "ターゲットはnull");
            var text = args[1].Object as string;
            return target.FindValue(text) != null;
        }

        public static bool HasFunction(Value[] args)
        {
            Log.Assert(args.Length >= 2, "引数が足りません");
            var target = args[0].Object as Class;
            Log.Assert(target != null, "ターゲットはnull");
            var text = args[1].Object as string;
            return target.FindFunction(text) != null;
        }
    }
}